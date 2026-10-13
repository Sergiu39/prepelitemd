# prepeliteMD — Specificația versiunii 1

> Document viu. Se corectează pe măsură ce luăm decizii. Ultima actualizare: 13 octombrie 2026.

## 1. Ce este aplicația

O aplicație pentru gestionarea unei ferme mici sau mijlocii de păsări și animale. Crescătorul își ține evidența
animalelor, a hranei, a sănătății, a producției și a banilor, din telefon sau din browser.

- **Produs comercial**, pentru public larg, internațional.
- **Platforme**: Android, iPhone și web, dintr-un singur cod (Flutter).
- **Doar online**: datele stau pe server. Dacă semnalul cade pentru scurt timp, aplicația păstrează ultimele
  modificări și le trimite când revine conexiunea. Nu există mod de lucru complet fără internet.
- **Limbi (7)**: română, rusă, ucraineană, engleză, spaniolă, franceză, turcă. Limba se alege automat după telefon și
  se poate schimba din setări.

## 2. Pentru cine

| Cine | Ce face în aplicație |
|---|---|
| **Proprietarul fermei** | Creează ferma, plătește abonamentul, invită oameni, vede tot (inclusiv banii). |
| **Îngrijitor / angajat** | Înregistrează zilnic: ouă, hrană, mortalitate, tratamente. Nu vede banii. |
| **Contabil / vizitator** (mai târziu) | Doar citește rapoartele. |

Un cont poate avea mai multe ferme, iar o fermă poate avea mai mulți oameni.

## 3. Modulele versiunii 1

Pornim cu trei specii. Fiecare este un **modul** separat, ca să putem adăuga ușor altele (rațe, curcani, capre etc.).

1. **Prepelițe** — ouă și carne
2. **Pui de găină** — ouătoare și broiler
3. **Iepuri** — reproducție și carne

## 4. Funcții comune tuturor modulelor

### 4.1 Loturi / cuști
Un **lot** este un grup de animale crescute împreună (o cușcă, o hală, o serie de pui).
- nume, specie, scop (ouă / carne / reproducție)
- data intrării, vârsta la intrare, numărul inițial
- proveniența (incubat în fermă, cumpărat de la…)
- numărul actual, calculat automat din mortalitate, vânzări și sacrificări
- **mortalitate**: data, câte, cauza (opțional)
- lotul se poate închide (vândut sau sacrificat complet) și rămâne în istoric

### 4.2 Hrană
- tipuri de furaj (ex.: starter, creștere, ouătoare), cu preț pe kg
- **stoc**: intrări (cumpărare) și ieșiri (consum)
- **consum zilnic** pe lot
- avertizare când stocul scade sub o limită aleasă de utilizator

### 4.3 Sănătate
- vaccinări și tratamente pe lot: data, produs, doză, observații
- **perioada de așteptare** pentru ouă și carne după tratament (aplicația avertizează)
- **reamintiri** pentru următoarea vaccinare sau tratament (notificare pe telefon)

### 4.4 Producție
| Modul | Ce se înregistrează |
|---|---|
| Prepelițe | ouă pe zi pe lot, ouă sparte; procent de ouat calculat automat |
| Pui de găină | ouă pe zi (ouătoare); greutate medie și sacrificare (broiler) |
| Iepuri | monte, fătări (câți pui, câți vii), înțărcare, greutate, sacrificare |

### 4.5 Bani
- **cheltuieli**: hrană, medicamente, animale cumpărate, altele, legate opțional de un lot
- **vânzări**: ouă, carne, animale vii
- **profit pe lot** și pe perioadă
- moneda se alege la crearea fermei

### 4.6 Panou principal (prima pagină)
- câte animale vii sunt pe fiecare specie
- ouăle de azi și din ultimele 7 zile
- reamintiri apropiate (vaccinări, stoc mic)
- profitul lunii curente

## 5. Ce NU intră în versiunea 1

- mod complet offline
- alte specii decât cele trei
- incubator (urmărirea ouălor la incubat), planificare genetică
- magazin sau piață între crescători
- integrare cu cântare sau senzori

Le adăugăm pe rând, după ce prima versiune merge bine.

## 6. Abonamente (schiță, se decide mai târziu)

| Plan | Ce include |
|---|---|
| **Gratuit** | 1 fermă, 1 utilizator, maxim 3 loturi active |
| **Standard** | loturi nelimitate, rapoarte, export |
| **Pro** | mai mulți utilizatori, mai multe ferme |

Plata: prin magazinele Google Play și App Store pe telefon, prin Stripe pe web.

## 7. Tehnologie (pe scurt)

- **Flutter**: aplicația (Android, iPhone, web)
- **Supabase**: baza de date, conturile și fișierele; datele fiecărei ferme sunt separate și protejate
- **Stripe / plăți în magazine**: abonamentele

## 8. Pașii următori

1. ✅ Specificația (acest document) — de corectat de Sergiu
2. ✅ Scheletul aplicației: structură, cele 7 limbi, meniu pentru cele trei module, date de probă
3. Ecrane reale pentru loturi, mortalitate și ouă (prepelițe primele)
4. Conectare la Supabase: conturi, ferme, salvare date
5. Hrană, sănătate cu reamintiri, bani
6. Abonamente și publicare în magazine
