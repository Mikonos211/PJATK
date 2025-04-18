import math
# Zadanie 1
x = 0.1
y = float(input("Podaj y: "))
sum = 0

for i in range(1, 11):
    sin_value = math.sin(x)
    cos_value = math.cos(x)
    print(i, "sin", round(sin_value, 4))
    print(i, "cos", round(cos_value, 4))
    if sin_value > cos_value and x <= 1:
        wynik1 = ((x + y) ** i) / math.factorial(i)
        print("Liczenie szeregu ", round(wynik1,2))
        sum = sum + wynik1
    else:
        wynik2 = x ** 5 + x ** 3 * y ** 2 + y ** 4
        print("Liczenie równania ", round(wynik2,2))
    x = x + 0.1

print(round(sum,2))

# Zadanie 2
import numpy as np

n = 5
X = 5
wartosc = int(input("Podaj próg sumy elementów kolumny: "))
K = 3

A = np.zeros((n, n), dtype=float)
for i in range(n):
    for j in range(n):
        if i < j:
            A[i, j] = round(np.random.uniform(-3 * i - 1, 6 * j + 4), 2)
        else:
            A[i, j] = round(np.random.uniform(0, 7), 2)

print("Tablica A przed przesunięciem:")
for row in A:
    print(" ".join(map(str, row)))

for j in range(A.shape[1]):
    suma_kolumny = np.sum(A[:, j])
    if suma_kolumny > wartosc:
        A[:, j] = np.roll(A[:, j], -2)
    else:
        A[:, j] = np.roll(A[:, j], K)

print("\nTablica A po przesunięciu:")
for row in A:
    print(" ".join(map(str, row)))

# Zadanie 3
import random
import numpy as np

car_brands = ["Nissan", "Fiat", "Volkswagen", "Audi", "BMW", "Honda"]


def fill_car_list(size):
    car_array = np.array([[(random.choice(car_brands), random.randint(1990, 2024),
                            round(random.uniform(5000, 50000), 2)) for _ in range(size)] for _ in range(size)],
                         dtype=object)
    return car_array


def increase_price(car_array):
    youngest_prices = np.min([[car[2] for car in row] for row in car_array], axis=0)
    for j in range(len(car_array[0])):
        for i in range(len(car_array)):
            car_array[i][j][2] += youngest_prices[j]


def print_data(car_array):
    oldest_car_year_of_production = min(car[1] for row in car_array for car in row if 'f' not in car[0].lower() and 'z' not in car[0].lower())

    if oldest_car_year_of_production is None:
        print("Brak aut w tablicy spełniających warunki.")
        return

    for row in car_array:
        for car in row:
            if 'f' not in car[0].lower() and 'z' not in car[0].lower() and car[1] == oldest_car_year_of_production:
                print("Marka:", car[0])
                print("Rok produkcji:", car[1])
                print("Cena:", car[2])
                print()


def increase_price_on_diagonal_by_percentage(car_list, percentage=15):
    n = min(len(car_list), len(car_list[0]))
    diagonal_prices = [car_list[i][i][2] for i in range(n)]
    for i in range(n):
        car_list[i][i][2] *= 1 + percentage / 100
    for i in range(n):
        car_list[i][i][2] = max(car_list[i][i][2], diagonal_prices[i])


def main():
    n = int(input("Podaj rozmiar tablicy: "))

    print("Wypełnij pierwszą tablicę:")
    car_array1 = fill_car_list(n)
    increase_price(car_array1)
    print_data(car_array1)

    print("Wypełnij drugą tablicę:")
    car_array2 = fill_car_list(n)
    increase_price(car_array2)
    print_data(car_array2)

    increase_price_on_diagonal_by_percentage(car_array1)
    increase_price_on_diagonal_by_percentage(car_array2)

    print("Po zwiększeniu cen na przekątnych:")
    print_data(car_array1)
    print_data(car_array2)


if __name__ == "__main__":
    main()
# Zadanie 4

class Node:
    def __init__(self, data):
        self.data = data
        self.next = None

class StringLinkedList:
    def __init__(self):
        self.head = None

    def add_node(self, data):
        new_node = Node(data)
        if self.head is None:
            self.head = new_node
            return
        last_node = self.head
        while last_node.next:
            last_node = last_node.next
        last_node.next = new_node

    def display_list(self):
        current_node = self.head
        while current_node:
            print(current_node.data)
            current_node = current_node.next

    def remove_every_other_lowercase(self):
        count = 0
        current_node = self.head
        prev_node = None
        while current_node and current_node.next:
            if current_node.next.data[0].islower():
                if prev_node:
                    prev_node.next = current_node.next
                else:
                    self.head = current_node.next
                count += 1
            prev_node = current_node.next
            current_node = current_node.next.next if current_node.next else None
        return count

    def move_longer_string_to_beginning(self):
        if self.head is None or self.head.next is None or self.head.next.next is None:
            return
        current_node = self.head.next.next
        prev_node = self.head.next
        while current_node:
            if len(current_node.data) > len(prev_node.data) and len(current_node.data) > len(self.head.data):
                temp = current_node
                prev_node.next = current_node.next
                temp.next = self.head
                self.head = temp
                return
            prev_node = current_node
            current_node = current_node.next

n = int(input("Podaj liczbę elementów w liście: "))
string_list = StringLinkedList()

for i in range(n):
    data = input(f"Podaj napis dla elementu {i+1}: ")
    string_list.add_node(data)

print("Lista jednokierunkowa przed usunięciem i przesunięciem:")
string_list.display_list()

removed_count = string_list.remove_every_other_lowercase()

string_list.move_longer_string_to_beginning()

print("\nLista jednokierunkowa po usunięciu i przesunięciu:")
string_list.display_list()
print(f"Liczba usuniętych elementów: {removed_count}")


# Zadanie 5

import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler, LabelEncoder
from imblearn.over_sampling import SMOTE
from sklearn.neighbors import KNeighborsClassifier
from sklearn.metrics import classification_report, accuracy_score

file_path = 'loty.csv'
data = pd.read_csv(file_path)

print("Initial data:")
print(data.head())

initial_row_count = len(data)
print(f'Initial number of rows: {initial_row_count}')

columns_to_drop = ['Unnamed: 0', 'id']
data.drop(columns=columns_to_drop, inplace=True)
data.dropna(inplace=True)

final_row_count = len(data)
print(f'Liczba wierszy po czyszczeniu danych: {final_row_count}')

print("Pierwsze 30 wierszy po czyszczeniu danych:")
print(data.head(30))

label_encoders = {}
for column in data.select_dtypes(include=['object']).columns:
    le = LabelEncoder()
    data[column] = le.fit_transform(data[column])
    label_encoders[column] = le
final_row_count = len(data)
print(f'Number of rows after data cleaning: {final_row_count}')

print("First 30 rows after data cleaning:")
print(data.head(30))

label_encoders = {}
for column in data.select_dtypes(include=['object']).columns:
    le = LabelEncoder()
    data[column] = le.fit_transform(data[column])
    label_encoders[column] = le

print("First 30 rows after encoding:")
print(data.head(30))

target_column = 'satisfaction'
X = data.drop(columns=target_column)
y = data[target_column]

X_train_val, X_test, y_train_val, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
X_train, X_val, y_train, y_val = train_test_split(X_train_val, y_train_val, test_size=0.25, random_state=42)

print(f'Training set size: {X_train.shape}')
print(f'Validation set size: {X_val.shape}')
print(f'Test set size: {X_test.shape}')

scaler = StandardScaler()
X_train_scaled = scaler.fit_transform(X_train)
X_val_scaled = scaler.transform(X_val)
X_test_scaled = scaler.transform(X_test)

print("Sample scaled training rows:")
print(X_train_scaled[:5])

smote = SMOTE(random_state=42)
X_train_resampled, y_train_resampled = smote.fit_resample(X_train_scaled, y_train)
print(f'Training set size after oversampling: {X_train_resampled.shape}')

knn = KNeighborsClassifier(n_neighbors=5)
knn.fit(X_train_resampled, y_train_resampled)

y_val_pred = knn.predict(X_val_scaled)

accuracy = accuracy_score(y_val, y_val_pred)
report = classification_report(y_val, y_val_pred)

print(f'Validation set accuracy: {accuracy}')
print('Classification report:')
print(report)

