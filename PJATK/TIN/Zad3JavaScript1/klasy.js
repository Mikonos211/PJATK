class Person {
    constructor(imie, wiek){
        this.imie = imie;
        this.wiek = wiek;
    }
    getImie(){
        return this.imie;
    }
    getWiek(){
        return this.wiek;
    }
    setImie(imie){
        this.imie = imie;
    }

    setWiek(wiek){
        if (wiek > 0) {
            this.wiek = wiek;
        } else {
            console.log('Wiek musi być liczbą dodatnią.');
        }  
    }
}
class Student extends Person{
    constructor(imie, wiek, Kierunek){
        super( imie, wiek);
        this.Kierunek = Kierunek;
    }
    getKierunek(){
        return this.Kierunek;
    }
    setKierunek(Kierunek){
        this.Kierunek = Kierunek;
    }
}

const person = new Person('Mikołaj' , 21)
const student = new Student(person, 'CS')