<?php

class ConNguoi
{
    var $name;
    var $mat;
    var $mui;
    const sochan = 2;

    function an()
    {
        //code
         return $this->getSoChan();
    }

    function noi()
    {
        //code
        return $this->name = $caunoi;
    }

    function di()
    {
        //code
    }


    function getSoChan(){
    return self::sochan;
    //className::propertyName;

	}
}

//new className;
//hoặc
$Tai = new ConNguoi();
$newClass->propertyName;
ConNguoi::sochan;

class Person
{
    //khai báo thuộc tính xe dạng protected
    protected $name;
}

class Male extends Person
{
    function setName($name)
    {
        //đúng vì sử dụng trong class con
        $this->name = $name;
    }

    function getName()
    {
        //đúng vì sử dụng trong class con
        return $this->name;
    }
}

//khởi tạo lớp Person
$person = new Person();
//Sai vì biến name có visibility là protect nên không tác động từ ngoài class vào được
$person->name;
//khởi tạo lớp Male
$male = new Male();
//tác động vào biến name qua hàm setName
$male->setName('Vũ Thanh Tài');
echo $male->getName();

lass Foo
{
    //Khai báo phương thức khởi tạo
    public function Foo()
    {
        echo 'Class Foo được khởi tạo';
    }
}

new Foo();
//kết quả: Class Foo được khởi tạo


class Foo
{
    public function __construct()
    {
        echo 'Class Foo được khởi tạo';
    }
}

new Foo();
//kết quả: Class Foo được khởi tạo
class Foo
{
    public function __destruct()
    {
        echo 'Class Foo được hủy';
    }
}

$foo = new Foo();
//kết quả: Class Foo được hủy

class Foo
{
    public function __construct()
    {
        echo 'Class Foo được khởi tạo';
    }

    public function getMessage()
    {
        echo 'Đây là class Foo';
    }

    public function __destruct()
    {
        echo 'Class Foo được hủy';
    }
}

$foo = new Foo();
//kết quả: Class Foo được khởi tạo
$foo->getMessage();
//kết quả: Đây là class Foo
//kết quả: Class Foo được hủy

class Bar
{
    public function __construct()
    {
        echo 'Class Bar được khởi tạo';
    }

    public function __destruct()
    {
        echo 'Class Bar được hủy';
    }
}

class Foo extends Bar
{
    public function __construct()
    {
        echo 'Class Foo được khởi tạo';
    }

    public function __destruct()
    {
        echo 'Class Foo được hủy';
    }
}

$foo = new Foo();
//Kết quả: Class Foo được khởi tạo
//kết quả: Class Foo được hủy

class Bar
{
    public function __construct()
    {
        echo 'Class Bar được khởi tạo';
    }

    public function __destruct()
    {
        echo 'Class Bar được hủy';
    }
}

class Foo extends Bar
{
    public function __construct()
    {
        //gọi phương thức khởi tạo của class cha
        parent::__construct();
        echo 'Class Foo được khởi tạo';
    }

    public function __destruct()
    {
        //gọi phương thức hủy của class cha
        parent::__destruct();
        echo 'Class Foo được hủy';
    }
}

$foo = new Foo();
//Kết quả: Class Bar được khởi tạo
//Kết quả: Class Foo được khởi tạo
//kết quả: Class Bar được hủy
//kết quả: Class Foo được hủy

abstract class Person
{
    //khai báo một abstract method đúng
    abstract public function getName();

    //Sai vì abstract class không thể viết code xử lý được
    abstract public function getHeight()
    {
        //
    }
}

abstract class Person
{
    // đúng
    //khai báo một phương thức
    protected function getName()
    {
        //code
    }
}

class People
{
    //sai vì không thể khai báo một phương thức absract trong class bình thường.
    abstract public function getA();
}


abstract class Person
{
    //body
}
//Sai
$person= new Person();


abstract class Dongvat
{
    protected $name;

    abstract protected function getName();
}

//class này sai vì chưa định nghĩa lại phương thức abstracs getName
class ConTrau extends Dongvat
{
    //
}

//class này đúng vì đã định nghĩa lại đầy đủ các phương thức abstract
class ConBo extends Dongvat
{
    public function getName()
    {
        return $this->name;
    }
}


Tính chất của interface.
-Sau đây mình sẽ liệt kê ra các tính chất của interface:

Interface không phải là một đối tượng.
Trong interface chúng ta chỉ được khai báo phương thức chứ không được định nghĩa chúng.
Trong interface chúng ta có thể khai báo được hằng nhưng không thể khai báo biến.
Một interface không thể khởi tạo được (vì nó không phải là một đối tượng).
Các lớp implement interface thì phải khai báo và định nghĩa lại các phương thức có trong interface đó.
Một class có thể implement nhiều interface.
Các interface có thể kế thừa lẫn nhau.


interface DongVat
{
    //đúng vì chúng ta chỉ khai báo phương thức trong interface
    public function setName();

    //Sai vì chúng ta không được định nghĩa phương thức trong interface
    public function getName()
    {
        //
    }
}

interface DongVat
{
    //đúng vì trong interface có thể khai báo hằng
    const CONNGUOI = False;

    //Sai vì trong interface không thể khai báo biến
    public $name;

}

interface DongVat
{
    //
}

//sai vì interface không thể khởi tạo được
$dongvat = new DongVat();

interface DongVat
{
    public function getName();
}

//Class này đúng vì đã khai báo và định nghĩa lại phương thức getName
//trong interface
class ConTrau implements DongVat
{
    private $name;

    public function getName()
    {
        return $this->name;
    }
}

//Class này sai vì chưa khai báo và định nghĩa lại phương thức getName
//trong interface
class ConBo implements DongVat
{
    private $name;

    public function setName($name)
    {
        $this->name = $name;
    }
}


interface DongVat
{
    public function getName();
}

interface ConTrau
{
    public function checkSung();
}

class ConNghe implements DongVat, ConTrau
{
    private $name;

    const SUNG = false;

    public function getName()
    {
        return $this->name;
    }

    public function checkSung()
    {
        return self::SUNG;
    }
}


interface DongVat
{
    public function getName();
}

interface ConTrau extends Dongvat
{
    public function checkSung();
}

class ConNghe implements ConTrau
{
    private $name;
    const SUNG = false;

    public function getName()
    {
        return $this->name;
    }

    public function checkSung()
    {
        return self::SUNG;
    }
}


Một lớp được khai báo là abstract thì đó là lớp trừu tượng.

- Đối với lớp này thì nó sẽ có các điểm khác sau:

Các phương thức ( hàm ) khi được khai báo là abstract thì chỉ được định nghĩa chứ không được phép viết code xử lý trong phương thức.
Trong abstract class nếu không phải là phương thức abstract thì vẫn khai báo và viết code được như bình thường.
Phương thức abstract chỉ có thể khai báo trong abstract class. 
Các thuộc tính trong abstract class thì không được khai báo là abstract.
Không thể khởi tạo một abstract class.
Vì không thể khởi tạo được abstract class nên các phương thức chỉ được khai báo ở mức độ protected và public.
Các lớp kế thừa một abstract class phải định nghĩa lại tất cả các phương thức trong abstract class đó ( nếu không sẽ bị lỗi).


Static là gì?
-Static trong lập trình hướng đối tượng là một thành phần tĩnh (có thể là thuộc tính hoặc phương thức) mà nó hoạt động như một biến toàn cục, dù cho nó có được xử lý ở trong bất kỳ một file nào đi nữa (trong cùng một chương trình) thì nó đều lưu lại giá trị cuối cùng mà nó được thực hiện vào trong lớp.

class ConNguoi
{
    private static $name;

    public static function setName($name)
    {
        //code
    }

    public static function getName()
    {
        //code
    }
}


class ConNguoi
{
    private $name = 'amonymouse';

    public function setName($name)
    {
        $this->name = $name;
    }

    public function getName()
    {
        return $this->name;
    }
}

//khởi tạo đối tượng con người
$chuBlog = new ConNguoi();
//set name cho đối tượng
$chuBlog->setName('Vũ Thanh Tài');
//in ra name của đối tượng
echo $chuBlog->getName();
//kết quả: Vũ Thanh Tài
//khởi tạo đối tượng Con người
$nguoixem = new ConNguoi();
//hiển thị ra tên người xem
echo $nguoixem->getName();
//Kết quả: amonymouse



class ConNguoi
{
    private static $name = 'amonymouse';

    public function setName($name)
    {
        self::$name = $name;
    }

    public function getName()
    {
        return self::$name;
    }
}

//khởi tạo đối tượng con người
$chuBlog = new ConNguoi();
//set name cho đối tượng
$chuBlog->setName('Vũ Thanh Tài');
//in ra name của đối tượng
echo $chuBlog->getName();
//kết quả: Vũ Thanh Tài
//khởi tạo đối tượng Con người
$nguoixem = new ConNguoi();
//hiển thị ra tên người xem
echo $nguoixem->getName();
//Kết quả: Vũ Thanh Tài


class ConNguoi
{
    private static $name = 'Vũ Thanh Tài';

    public static function getName()
    {
        //gọi thuộc tính tĩnh
        return self::$name;
        //hoặc
        return ConNguoi::$name;
    }

    public function showAll()
    {
        //gọi phương thức tĩnh
        return self::getName();
        //hoặc 
        return ConNguoi::getName();
    }
}


class ConNguoi
{
    public static $name = 'Vũ Thanh Tài';

    public static function getName()
    {
        //gọi thuộc tính tĩnh
        return self::$name;
        //hoặc
        return ConNguoi::$name;
    }

    public static function showAll()
    {
        //gọi phương thức tĩnh
        return self::getName();
        //hoặc 
        return ConNguoi::getName();
    }
}

//gọi thuộc tính tĩnh
ConNguoi::$name;
//gọi phương thức tĩnh
ConNguoi::showAll();
//hoặc
$connguoi = new ConNguoi();
$connguoi->showAll();

class ConNguoi
{
    private static $name = 'Vũ Thanh Tài';

    public static function getName()
    {
        return ConNguoi::$name;
    }
}

class NguoiLon extends ConNguoi
{
    public function getName()
    {
        parent::getName();
    }
}


Như ở trên mình có nói 'static nó hoạt động như một biến toàn cục' và cũng vì điều này mà khi sử dụng static trong chương trình thì nó sẽ chiếm nhiều tài nguyên hơn các thành phần thường.



-Final dịch ra tiếng việt có nghĩa là sau cùng và trong lập trình hướng đối tượng thì final được ứng dụng vào class và phương thức.

Final class
-Khi một class được khai báo là final thì không lớp nào có thể kế thừa nó và nó chỉ có thể khởi tạo được thôi.

Cú pháp: Khai báo final class.



final class ConNguoi
{
    //
}
//Sai vì không thể kế thừa final class
class NguoiLon extends ConNguoi
{

}
//Fatal error: Class NguoiLon may not inherit from final class (ConNguoi)


class ConNguoi
{
    private $soChan = 2;

    final public function getSoChan()
    {
        return $this->soChan;
    }
}

//Sai vì không thể override lại final phương thức
class NguoiLon extends ConNguoi
{
    public function getSoChan()
    {

    }
}
//Fatal error: Cannot override final method ConNguoi::getSoChan()


Ưu điểm
-Từ khái niệm trên thì các bạn chắc cũng có thể nhận ra các ưu điểm của nó rồi chứ? nó gồm có các ưu điểm như sau:

Giúp cho chúng ta tùy biến được các hành vi.
Nó giúp cho chúng ta có thể khởi tạo một đối tượng theo cách mình muốn.
Nhược điểm
Một magic methods có tốc độ chậm hơn các phương thức bình thường.
3, Các magic method trong PHP.
-Trong PHP có hỗ trợ chúng ta 15 magic method với từng chức năng khác nhau:

+ __construct(): gọi khi khởi tạo đối tượng.

+ __destruct(): goij khi hủy đối tượng.

+ __set(): gọi khi ta truyền dữ liệu cho một thuộc tính không được phép truy cập.

+ __get(): khi đọc dữ liệu từ một thuộc tính không được phép truy cập.

+ __isset(): được gọi khi gọi hàm isset() hoặc empty() trên một thuộc tính không được phép truy cập.

+ __unset(): được gọi khi hàm unset() được sử dụng trong một thuộc tính không được phép truy cập.

+ __call():được gọi khi ta gọi một phương thức không được phép truy cập trong phạm vi của một đối tượng.

+ __callstatic(): được kích hoạt khi ta gọi một phương thức không được phép truy cập trong phạm vi của một phương thức tĩnh.

+ __toString(): phương thức này giúp class chỉ định xem sẽ in ra cái gì khi nó được dùng.

+ __invoke():phương thức này được gọi khi một lệnh cố gắng gọi một đối tượng như một hàm.

+ __sleep(): được gọi khi serialize() một đối tượng.

+ __wakeup: được gọi khi unserialize() đối tượng.

+ __set_state():

+ __clone(): được sử dụng khi chúng ta clone một object.

+ __debugInfo(): được gọi khi chúng ta sử dụng hàm vardump().

-Hiện tại thì trên blog của mình đã có đầy đủ các bài hướng dẫn về từng magic methods, các bạn có thể tham khảo thêm ở đây.

namespace App\Controllers;

class HomeController
{
    //code
}

new tenNamespace\tenClass();


new tenNamespace\tenClass();


trait SetGetName
{
    // private $name;
    public function setName($name)
    {
        $this->name = $name;
    }

    public function getName()
    {
        return $this->name;
    }
}

trait SetGetAge
{
    public function setAge($age)
    {
        $this->age = $age;
    }

    public function getAge()
    {
        return $this->age;
    }
}

class ClassName
{
    use TraitName;

    //code
}


// Nhúng 2 file chứa trait
include 'SetGetName.php';
include 'SetGetAge.php';

//khai báo class ConNguoi
class ConNguoi
{
    private $name;
    private $age;
    //gọi trait SetGetName
    use SetGetName;
    //gọi trait SetGetAge
    use SetGetAge\SetGetAge;
}

//khởi tạo đối tượng.
$connguoi = new ConNguoi();
// set name;
$connguoi->setName('Vũ Thanh Tài');
// get name;
echo $connguoi->getName();
//Tạo khoảng trắng cho dễ phân biệt
echo '<br/>';
// set age
$connguoi->setAge(22);
//get age
echo $connguoi->getAge();

//Kết quả chương trình trả về
//Vũ Thanh Tài
//22


// Nhúng 2 file chứa trait
include 'SetGetName.php';
include 'SetGetAge.php';

//use namespace
use SetGetAge\SetGetAge;

//khai báo class ConNguoi
class ConNguoi
{
    private $name;
    private $age;
    //gọi trait SetGetName
    use SetGetName;
    //gọi trait SetGetAge
    use SetGetAge;
}

//khởi tạo đối tượng.
$connguoi = new ConNguoi();
// set name;
$connguoi->setName('Vũ Thanh Tài');
// get name;
echo $connguoi->getName();
//Tạo khoảng trắng cho dễ phân biệt
echo '<br/>';
// set age
$connguoi->setAge(22);
//get age
echo $connguoi->getAge();

//Kết quả chương trình trả về
//Vũ Thanh Tài
//22


trait A
{
   //
}
trait B
{
    use A;
   // 
}

//trait SetGetName
trait SetGetName
{
    public function setName($name)
    {
        $this->name = $name;
    }

    public function getName()
    {
        return $this->name;
    }

    public function getAll()
    {
        return $this->getName();
    }

}

//trait SetGetAge
trait SetGetAge
{
    public function setAge($age)
    {
        $this->age = $age;
    }

    public function getAge()
    {
        return $this->age;
    }

    public function getAll()
    {
        return $this->getAge();
    }
}


//trait SetGetName
trait SetGetName
{
    public function setName($name)
    {
        $this->name = $name;
    }

    public function getName()
    {
        return $this->name;
    }

    public function getAll()
    {
        return $this->getName();
    }

}

//trait SetGetAge
trait SetGetAge
{
    public function setAge($age)
    {
        $this->age = $age;
    }

    public function getAge()
    {
        return $this->age;
    }

    public function getAll()
    {
        return $this->getAge();
    }
}

class ConNguoi
{
    private $name;
    private $age;
    //gọi trait
    use SetGetName, SetGetAge;
}
//chương trình báo lỗi.
//Fatal error: Trait method getAll has not been applied,
//because there are collisions with other trait methods on ConNguoi



class ConNguoi
{
    private $name;
    private $age;
    //gọi trait
    use SetGetName, SetGetAge;

    public function getAll()
    {
        return $this->getName();
    }
}



class ConNguoi
{
    private $name;
    private $age;
    //gọi trait
    use SetGetName, SetGetAge {
        //ưu tiên sử dụng phương thức getall của trait SetGetAge
        SetGetAge::getAll insteadof SetGetName;
    }
}

// Khai báo trait Name
trait Name
{
    private static $name = 'Chưa xét';

    public function setName($name)
    {
        self::$name = $name;
    }

    public function getName()
    {
        return self::$name;
    }
}

//Khai báo class ConNguoi
class ConNguoi
{
    //gọi trait Name
    use Name;
}

//Khai báo class NguoiLon
class NguoiLon
{
    //gọi trait Name
    use Name;
}

// khởi tạo class ConNguoi
$connguoi = new ConNguoi();

//setName
$connguoi->setName('Vũ Thanh Tài');

//getName
echo $connguoi->getName();
//Kết Quả: Vũ Thanh Tài

//Khởi tạo class ConNguoi
$trecon = new ConNguoi();

//getName
echo $trecon->getName();
//Kết Quả: Vũ Thanh Tài

//Khởi tạo class NguoiLon 
$nguoilon = new NguoiLon();

//getName
echo $nguoilon->getName();
//Kết Quả: Chưa xét



// Khai báo trait Name
trait Name
{
    public static function getName()
    {
        return 'Name Trait';
    }
}

//Khai báo class ConNguoi
class ConNguoi
{
    //gọi trait Name
    use Name;
}

// khởi tạo class ConNguoi
$connguoi = new ConNguoi();

//getName
echo $connguoi->getName();
//Kết Quả: Name Trait

//hoặc
echo ConNguoi::getName();
//Kết Quả: Name Trait



// Khai báo trait Name
trait Name
{
    //khai báo thuộc tính name= vũ Thanh Tài
    private $name = 'Vũ Thanh Tài';

    //định nghĩa phương thức getName
    abstract public function getName();
}

//Khai báo class ConNguoi
class ConNguoi
{
    //gọi trait Name
    use Name;

    //khai báo và định nghĩa lại phương thức getName()
    public function getName()
    {
        return $this->name;
    }
}

// khởi tọa class ConNguoi
$connguoi = new ConNguoi();
//getName
echo $connguoi->getName();
//Kết Quả: Vũ Thanh Tài

trait Name
{
    private $name = 'Vũ Thanh Tài';

    private function getName()
    {
        return $this->name;
    }
}

class ConNguoi
{
    use Name {
        //thay đổi visibitily thành public
        getName as public;
    }
}

$connguoi = new ConNguoi();
echo $connguoi->getName();
//Kết Quả: Vũ Thanh Tài



trait Name
{
    private $name = 'Vũ Thanh Tài';

    public function getName()
    {
        return $this->name;
    }
}

class ConNguoi
{
    use Name {
        //Định danh mới cho getName
        getName as doName;
    }
}

$connguoi = new ConNguoi();

echo $connguoi->doName();
//Kết Quả: Vũ Thanh Tài



trait Name
{
    private $name = 'Vũ Thanh Tài';

    private function getName()
    {
        return $this->name;
    }
}

class ConNguoi
{
    use Name {
        //Định danh mới cho getName
        getName as public doName;
    }
}

$connguoi = new ConNguoi();

echo $connguoi->doName();
//Kết Quả: Vũ Thanh Tài


Traits với interface
-Giống nhau: Đều không có thể khởi tạo được mà chỉ có thể khai báo.

-Khác nhau:

Trait:
Có thể khai báo thuộc tính.
Có thể định nghĩa và khởi tạo phương thức.
interface:
Chỉ có thể khai báo thuộc tính cố định (hằng).
Chỉ có thể định nghĩa không thể khai báo.
Traits với abstract
-Giống nhau: Đều không có thể khởi tạo được mà chỉ có thể khai báo.

-Khác nhau:

Trait:
Có thể lồng nhau một cách đơn giản
abstract:
Khi muốn sử dụng lẫn nhau phải kế thừa hết sức lằng nhằng.


function getRole($role)
{
    return $role();
}

echo getRole(function () {
    return 'Học lập trình online toidicode.com';
});


class Role
{
    public $role;

    public function __construct($role)
    {
        $this->role = $role;
    }

    function getRole($role)
    {
        return $role();
    }
}

//khởi tạo class Role
$role = new Role(function () {
    return 'Học lập trình PHP Toidicode.com';
});
//gán data bằng thuộc tính role
$data = $role->role;
//hiển thị role
echo $data();
//Kết quả: Học lập trình PHP Toidicode.com
//gọi getRole
echo $role->getRole(function () {
    return 'Học lập trình Nodejs Toidicode.com';
});
//Kêt quả: Học lập trình Nodejs Toidicode.com



$content = function ($message) {
    return 'Content: ' . $message;
};

echo $content('Học Lập trình');



$scope = 'Vũ Thanh Tài';

$name = function () use ($scope) {
    return $scope;
};

echo $name();
//Kết quả: Vũ Thanh Tài




$number = 1;

$getNextNumber = function () use (&$number) {
    return ++$number;
};

$getPreNumber = function () use (&$number) {
    return --$number;
};

echo $getNextNumber();
//kết quả: 2

echo $number;
// Kết quả: 2

echo $getPreNumber();
//Kết quả: 1



class Cart
{
    const PRICE_BUTTER = 1.00;
    const PRICE_MILK = 3.00;
    const PRICE_EGGS = 6.95;

    protected $products = array();

    public function add($product, $quantity)
    {
        $this->products[$product] = $quantity;
    }

    public function getQuantity($product)
    {
        return isset($this->products[$product]) ? $this->products[$product] :
            FALSE;
    }

    public function getTotal($tax)
    {
        $total = 0.00;

        $callback =
            function ($quantity, $product) use ($tax, &$total) {
                $pricePerItem = constant(__CLASS__ . "::PRICE_" .
                    strtoupper($product));
                $total += ($pricePerItem * $quantity) * ($tax + 1.0);
            };

        array_walk($this->products, $callback);
        return round($total, 2);
    }
}

$my_cart = new Cart;

// Thêm sản phẩm
$my_cart->add('butter', 1);
$my_cart->add('milk', 3);
$my_cart->add('eggs', 6);

// In ra tổng số tiền khi đã sale 5%.
print $my_cart->getTotal(0.05) . "\n";
// Kết Quả: 54.29


Từ các phần trên mình đã tổng kết ra các điểm giống và khác nhau của $this và self trong PHP qua ảnh sau:

$this vs self trong PHP

4, Lời kết.

Self: Truy xuất đến class khai báo nó.
Static: Truy xuất đến đối tượng hiện tại



