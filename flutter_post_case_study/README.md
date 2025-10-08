# Flutter Post Case Study

Bu proje, Flutter kullanarak bir blog/posts uygulaması örneğidir. GetX ile state management yapılmış ve JSONPlaceholder API kullanılarak postlar çekilip gösterilmektedir.

---

## 📸 Ekran Görüntüleri

<p float="left">
             <img src="https://github.com/user-attachments/assets/1a8b8b1b-b834-4910-bb0c-8d2ac4b44f13" width="200" height="500"/>
            <img src="https://github.com/user-attachments/assets/3e2a8628-61e7-4183-a3fe-91209f8889de" width="200" height="500"/>
   <br>
          <img src="https://github.com/user-attachments/assets/1e5d1ede-7ed1-4e95-ada3-584bef871fc4" width="200" height="500"/>
          <img src="https://github.com/user-attachments/assets/77d2def5-e5e7-4282-af2b-e7616f07f814" width="200" height="500"/>

  <br>
      <img src="https://github.com/user-attachments/assets/580604ee-2379-48a6-acb6-afe47e7e59f5" width="200" height="500"/>
      <img src="https://github.com/user-attachments/assets/3dca0d19-2269-4f14-a283-f568246dc0a2" width="200" height="500"/>
</p>


## 🚀 Teknolojiler

- **Flutter**: UI geliştirme
- **GetX**: State management ve dependency injection
- **GetConnect**: HTTP istekleri
- **MVC Mimari**: Model-View-Controller yapısı
- **Lottie**: API durum animasyonları
- **CachedNetworkImage**: Görseller için önbellekleme

---

## 📦 Klasör Yapısı

``` lib/
├─ app/
│ ├─ data/
│ │ ├─ models/ # Post ve diğer model sınıfları
│ │ ├─ providers/ # API bağlantıları (GetConnect)
│ │ ├─ repositories/ # API çağrılarının mantığı
│ │ └─ services/ # Filtreleme ve arama servisleri
│ │
│ ├─ modules/
│ │ ├─ home/
│ │ │ ├─ bindings/ # HomeController için binding
│ │ │ ├─ controllers/ # HomeController
│ │ │ └─ views/ # HomeView
│ │ └─ detail/
│ │ ├─ bindings/ # DetailController binding
│ │ ├─ controllers/ # DetailController
│ │ └─ views/ # DetailView
│ │
│ ├─ widgets/ # Özelleştirilmiş reusable widget'lar
│ └─ routers/ # AppPages ve route tanımları
│
├─ core/
│ ├─ constants/ # Sabitler (padding, API url, resimler)
│ ├─ enums/ # Enumlar (API durumları, status code)
│ └─ extensions/ # Extension metotlar
```


## 🌐 API Kullanımı

- **Tüm postları çekme:**  
  `GET https://jsonplaceholder.org/posts`

- **Tek bir post detayını çekme:**  
  `GET https://jsonplaceholder.org/posts/{id}`

## 📌 Özellikler

- **Ana ekran**
  - Tüm postlar listelenir
  - Post başlık, tarih ve okuma süresi gösterilir
  - Arama alanı ile başlığa göre filtreleme
  - Kategori filtreleme (post verisi üzerinden türetilmiş)
  
- **Detay ekranı**
  - Seçilen postun detaylarını gösterir
  - Read All / Read Less özelliği ile uzun içerik gösterimi
  - Arka plan görseli post resmi

- **State yönetimi**
  - API yüklenme, hata ve veri bulunamama durumları Lottie animasyonları ile gösterilir
  - GetX reactive değişkenler ile UI anlık güncellenir

- **Dependency Injection**
  - GetX binding kullanılarak controller, repository ve servisler lazy olarak başlatılır

---

## 🛠 Kurulum

```bash
# Flutter paketlerini yükle
flutter pub get

# Uygulamayı çalıştır
flutter run
