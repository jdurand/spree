## Spree 2.0.1 (unreleased) ##

*  Sandbox generator and installer now use the correct 2-0-stable branch of spree_auth_devise 
3179a7ac85d4cfcb76622509fc739a0e17668d5a & 759fa3475f5230da3794aed86503913978dde22d.

    *John Dyer and Sean Schofield*

* Revert bump of Rubygems required version which made Spree 2.0.0 unusable on Heroku. 77103dc4f4c93c195ae20f47944f68ef31a7bbe9

    *@Actven*

* Improve performance of `Order#payment_required?` by not updating the totals every time. #3040 #3086

    *Washington Luiz*
    
* Remove after_save callback for stock items backorders processing and
    fixes count on hand updates when there are backordered units #3066

    *Washington Luiz*

* InventoryUnit#backordered_for_stock_item no longer returns readonly objects
    neither return an ActiveRecored::Association. It returns only an array of
    writable backordered units for a given stock item #3066

    *Washington Luiz*

* Scope shipping rates as per shipping method display_on #3119
    e.g. Shipping methods set to back_end only should not be displayed on frontend too

   *Washington Luiz*

* Translation for admin tabs are now located under the `spree.admin.tab` key. Previously, they were on the top-level, which lead to conflicts when users wanted to override view translations, like this:

```yml
en:
  spree:
    orders:
      show:
        thank_you: "Thanks, buddy!"
```

See #3133 for more information.

    * Ryan Bigg*
