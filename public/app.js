function something()
	{
        //запись значения из localStorage в переменную  
        var x = window.localStorage.getItem('bbb');

        //проблема с со сложением строк и переводом их в тип integer решается умножением на еденицу
        x = x * 1 + 1;

        //запись в localStorage значения
        window.localStorage.setItem('bbb',x);
        
        //удоление из localStorage
        //window.localStorage.removeItem('aaa');

		alert(x);

	}