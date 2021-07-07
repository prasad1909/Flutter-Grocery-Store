from django.shortcuts import render
from django.http import HttpResponse
from .models import Product, Contact, Order, UpdateOrder
import json
from django.contrib.auth.decorators import login_required


@login_required(login_url='/login')
def home(request):
    return render(request, "shop/home.html")


@login_required(login_url='/login')
def about(request):
    return render(request, "shop/about.html")


@login_required(login_url='/login')
def contact(request):
    if request.method == 'POST':
        name = request.POST.get('name', '')
        email = request.POST.get('email', '')
        phone = request.POST.get('phone', '')
        description = request.POST.get('description', '')
        contact = Contact(name=name, email=email, phone=phone, description=description)
        contact.save()
        check = True
        return render(request, "shop/contact.html", {'check': check})
    return render(request, "shop/contact.html")


@login_required(login_url='/login')
def tracker(request):
    if request.method == "POST":
        order_id = request.POST.get('orderId', '')
        email = request.POST.get('email', '')
        try:
            order = Order.objects.filter(order_id=order_id, email=email)
            if len(order) > 0:
                update = UpdateOrder.objects.filter(order_id=order_id)
                itemList = order[0].items
                updates = []
                for item in update:
                    updates.append({'text': item.update_desc, 'time': item.time})
                    response = json.dumps([updates, itemList], default=str)
                return HttpResponse(response)
            else:
                return HttpResponse('{}')
        except Exception as e:
            return HttpResponse('{}')

    return render(request, "shop/tracker.html")


@login_required(login_url='/login')
def productView(request, myid):
    product = Product.objects.filter(product_id=myid)
    return render(request, "shop/productView.html", {'product': product[0]})


@login_required(login_url='/login')
def checkOut(request):
    if request.method == "POST":
        items = request.POST.get('items', '')
        name = request.POST.get('name', '')
        email = request.POST.get('email', '')
        address = request.POST.get('address', '') + " " + request.POST.get("address2", '')
        city = request.POST.get('city', '')
        state = request.POST.get('state', '')
        zip_code = request.POST.get('zip_code', '')
        phone = request.POST.get('phone', '')
        order = Order(items=items, name=name, email=email, address=address, city=city, state=state, zip_code=zip_code, phone=phone)
        order.save()
        update = UpdateOrder(order_id=order.order_id, update_desc="Order Placed Successfully")
        update.save()
        check = True
        order_id = order.order_id
        return render(request, "shop/checkout.html", {'check': check, 'order_id': order_id})
    return render(request, "shop/checkout.html")


@login_required(login_url='/login')
def search(request):
    return render(request, "shop/search.html")


@login_required(login_url='/login')
def fruits(request):
    products = []
    subcategories = Product.objects.values('subcategory', 'product_id')
    subcats = {item['subcategory'] for item in subcategories}
    #print(subcats)
    for subcat in subcats:
        prodtemp = Product.objects.filter(subcategory=subcat, category='Fruits & Vegetables')
        n = len(prodtemp)
        if n > 0:
            if n % 4 == 0:
                number_of_slides = n // 4
            else:
                number_of_slides = n // 4 + 1
            products.append([prodtemp, range(1, number_of_slides), number_of_slides])

    params = {'allProducts': products, 'category': 'fruits'}

    return render(request, "shop/products.html", params)


@login_required(login_url='/login')
def staples(request):
    products = []
    subcategories = Product.objects.values('subcategory', 'product_id')
    subcats = {item['subcategory'] for item in subcategories}
    print(subcats)
    for subcat in subcats:
        prodtemp = Product.objects.filter(subcategory=subcat, category='Daily Staples')
        n = len(prodtemp)
        if n > 0:
            if n % 4 == 0:
                number_of_slides = n // 4
            else:
                number_of_slides = n // 4 + 1
            products.append([prodtemp, range(1, number_of_slides), number_of_slides])

    params = {'allProducts': products, 'category': 'staples'}

    return render(request, "shop/products.html", params)


@login_required(login_url='/login')
def drinks(request):
    products = []
    subcategories = Product.objects.values('subcategory', 'product_id')
    subcats = {item['subcategory'] for item in subcategories}
    print(subcats)
    for subcat in subcats:
        prodtemp = Product.objects.filter(subcategory=subcat, category='Drinks & Beverages')
        n = len(prodtemp)
        if n > 0:
            if n % 4 == 0:
                number_of_slides = n // 4
            else:
                number_of_slides = n // 4 + 1
            products.append([prodtemp, range(1, number_of_slides), number_of_slides])

    params = {'allProducts': products, 'category': 'drinks'}
    return render(request, "shop/products.html", params)


@login_required(login_url='/login')
def snacks(request):
    products = []
    subcategories = Product.objects.values('subcategory', 'product_id')
    subcats = {item['subcategory'] for item in subcategories}
    print(subcats)
    for subcat in subcats:
        prodtemp = Product.objects.filter(subcategory=subcat, category='Snacks & Munchies')
        n = len(prodtemp)
        if n > 0:
            if n % 4 == 0:
                number_of_slides = n // 4
            else:
                number_of_slides = n // 4 + 1
            products.append([prodtemp, range(1, number_of_slides), number_of_slides])

    params = {'allProducts': products, 'category': 'snacks'}
    return render(request, "shop/products.html", params)


def searchMatch(query, item):
    query = query.lower()
    if query in item.description.lower() or query in item.product_name.lower() or query in item.subcategory.lower():
        return True
    else:
        return False


@login_required(login_url='/login')
def search(request):
    query = request.GET.get('search')
    allProds = []
    catprods = Product.objects.values('category', 'product_id')
    cats = {item['category'] for item in catprods}
    for cat in cats:
        prodtemp = Product.objects.filter(category=cat)
        prod = [item for item in prodtemp if searchMatch(query, item)]

        n = len(prod)
        if n % 4 == 0:
            number_of_slides = n // 4
        else:
            number_of_slides = n // 4 + 1
        if len(prod) != 0:
            allProds.append([prod, range(1, number_of_slides), number_of_slides])
    params = {'allProds': allProds, "msg": "", "query": query}
    if len(allProds) == 0:
        params = {'msg': f"No Results for {query} found"}
    return render(request, 'shop/search.html', params)


@login_required(login_url='/login')
def bestsellers(request):
    products = []
    categories = Product.objects.values('category', 'product_id')
    #cats = {item['category'] for item in categories}
    #p_ids = {item['product_id'] for item in categories}
    #print(f"from bestsellers {cats}")
    #print(f"from bestsellers {p_ids}")
    #for cat in cats:
        #prodtemp = Product.objects.filter(category=cat)
        #n = len(prodtemp)
        #print(f"{n} in {cat}")
        #if n > 0:
            #if n % 4 == 0:
                #number_of_slides = n // 4
            #else:
                #number_of_slides = n // 4 + 1
            #products.append([prodtemp, range(1, number_of_slides), number_of_slides])int
    orders = Order.objects.values('items')
    #print(orders)
    for item in categories:
        if item['category']=='Fruits & Vegetables':
            print(f"Fruits: {item['product_id']}")
        if item['category']=='Snacks & Munchies':
            print(f"Snacks: {item['product_id']}")
        if item['category']=='Drinks & Beverages':
            print(f"Drinks: {item['product_id']}")
        if item['category']=='Daily Staples':
            print(f"Staples: {item['product_id']}")
    p_list = []
    for i in range(1,70):
        count = 0
        for order in orders:
            order = json.loads(str(order['items']))
            for item in order:
                if item == f'pr{i}':
                    count += order[item][0]
        p_list.append([i, count])
    print(p_list)
    f_id = [1, 2]
    s_id = [3]
    st_id = [4]
    d_id = []
    for j in range(5,27):
        f_id.append(j)
    for j in range(27, 51):
        s_id.append(j)
    for j in range(62,70):
        st_id.append(j)
    for j in range(51,62):
        d_id.append(j)
    fruit = []
    drink = []
    staple = []
    snack = []
    for p in p_list:
        if p[0] in f_id:
            fruit.append([p[1],p[0]])
        elif p[0] in s_id:
            snack.append([p[1],p[0]])
        elif p[0] in st_id:
            staple.append([p[1],p[0]])
        elif p[0] in d_id:
            drink.append([p[1],p[0]])
    fruit = sorted(fruit)
    fruit = fruit[len(fruit)-4:]
    snack = sorted(snack)
    snack = snack[len(snack)-4:]
    staple = sorted(staple)
    staple = staple[len(staple)-4:]
    drink = sorted(drink)
    drink = drink[len(drink)-4:]
    
    products = []
    prodtemp = Product.objects.filter(product_id=fruit[0][1])|Product.objects.filter(product_id=fruit[1][1])|Product.objects.filter(product_id=fruit[2][1])|Product.objects.filter(product_id=fruit[3][1])
    products.append([prodtemp, range(1,1) ,1])
    prodtemp = Product.objects.filter(product_id=snack[0][1])|Product.objects.filter(product_id=snack[1][1])|Product.objects.filter(product_id=snack[2][1])|Product.objects.filter(product_id=snack[3][1])
    products.append([prodtemp, range(1,1) ,1])
    prodtemp = Product.objects.filter(product_id=drink[0][1])|Product.objects.filter(product_id=drink[1][1])|Product.objects.filter(product_id=drink[2][1])|Product.objects.filter(product_id=drink[3][1])
    products.append([prodtemp, range(1,1) ,1])
    prodtemp = Product.objects.filter(product_id=staple[0][1])|Product.objects.filter(product_id=staple[1][1])|Product.objects.filter(product_id=staple[2][1])|Product.objects.filter(product_id=staple[3][1])
    products.append([prodtemp, range(1,1) ,1])
    print(products)

    params = {'allProducts': products}
    return render(request, "shop/bestsellers.html", params)