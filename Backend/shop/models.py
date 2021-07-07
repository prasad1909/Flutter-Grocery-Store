from django.db import models


# Create your models here.
class Product(models.Model):
    product_id = models.AutoField(primary_key=True)
    product_name = models.CharField(max_length=50)
    description = models.CharField(max_length=80, default="")
    category = models.CharField(max_length=50, default="")
    subcategory = models.CharField(max_length=50, default="")
    price = models.IntegerField(default=0)
    publish_date = models.DateField()
    image = models.ImageField(upload_to="shop/images", default="")

    def __str__(self):
        return self.product_name


class Contact(models.Model):
    msg_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50)
    email = models.CharField(max_length=200)
    phone = models.CharField(max_length=50, default="")
    description = models.CharField(max_length=500, default="")

    def __str__(self):
        return self.name


class Order(models.Model):
    order_id = models.AutoField(primary_key=True)
    items = models.CharField(max_length=2000)
    name = models.CharField(max_length=50)
    email = models.CharField(max_length=200)
    address = models.CharField(max_length=50, default="")
    city = models.CharField(max_length=50, default="")
    state = models.CharField(max_length=50, default="")
    zip_code = models.CharField(max_length=6)
    phone = models.CharField(max_length=10)

    def __str__(self):
        return self.name


class UpdateOrder(models.Model):
    update_id = models.AutoField(primary_key=True)
    order_id = models.CharField(max_length=50)
    update_desc = models.CharField(max_length=100)
    time = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return str(self.update_id) + " " + self.update_desc[0:10]
