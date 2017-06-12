# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. Features and bugs were added to the initial Jungle skeleton which can be found at here(https://github.com/lighthouse-labs/jungle-rails).

Users can sign-up for an account, and browse products. Products are added to a cart and upon checkout, credit card information is handled via Stripe. An email confirmation is sent to the user as well. 

Using the administrator namespace, products and categories can be added. Upon addition, products are assigned a category and the product page can be filtered by categories (by regular users as well). 

![Jungle Home Page]()
![Jungle Cart Page]()


## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
