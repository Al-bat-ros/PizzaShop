/*function something()
	{
        //запись значения из localStorage в переменную  (строковую)
        var x = window.localStorage.getItem('bbb');

        //проблема d js с со сложением строк и переводом их в тип integer решается умножением на еденицу(тое-сть переводим type strige в int )
        x = x * 1 + 1;

        //запись в localStorage значения
        window.localStorage.setItem('bbb',x);
        
        //удоление из localStorage
        //window.localStorage.removeItem('aaa');

		alert(x);

	} */

function add_to_cart(id)
{
        var key = 'product_' + id;
        var x = window.localStorage.getItem(key);

        x = x * 1 + 1;

        window.localStorage.setItem(key, x);
   //вывод количества пицц
        update_orders_input();
        update_orders_button();
}  

 function update_orders_input()
 {
        var orders = cart_get_orders();
        $('#orders_input').val(orders);
 }   

 function update_orders_button()
 {
    var text = 'Cart (' + cart_get_number_of_items() + ')';
    $('#orders_button').val(text); //это jquery
 } 
 
 function cart_get_number_of_items()
 {
        var cnt = 0;

        for (var i = 0; i < window.localStorage.length; i++)
         {
            //здесь мы получаем key из хеша localStorage
            var key = window.localStorage.key(i);

            // получаем значение по ключу из хеша, аналог в ruby: hh[key] = x
            var value = window.localStorage.getItem(key); 

            if (key.indexOf('product_') == 0) 
            {
                 cnt = cnt + value * 1;
            }
         }
         return cnt;
 }
 
  function cart_get_orders()
 {
        var orders = '';

        for (var i = 0; i < window.localStorage.length; i++)
         {
            //здесь мы получаем key из хеша localStorage
            var key = window.localStorage.key(i);

            // получаем значение по ключу из хеша, аналог в ruby: hh[key] = x
            var value = window.localStorage.getItem(key); 

            if (key.indexOf('product_') == 0) 
            {
                 orders = orders + key + '=' + value + ',';
            }
         }
         return orders;
 }

 function cancel_order()
 {
  window.localStorage.clear();
  update_orders_button();
  update_orders_input();
 }