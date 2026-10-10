# code to import four random product without having a duplicate ,later imported this part of code in the project(Product_keyword.robot)

import random

class ProductUtils:
    def __init__(self):
        self.selected_products = []

    def select_random_products(self, products, count=4):
        if len(products) < count:
            raise ValueError(
                f"Cannot select {count} products from a list of {len(products)} products."
            )

        self.selected_products = random.sample(products, count)
        return self.selected_products
