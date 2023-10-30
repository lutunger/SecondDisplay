import random
import pymysql
from faker import Faker
from dotenv import load_dotenv
import os

# .env 파일로부터 환경 변수 로드
load_dotenv()

# 데이터베이스 연결 설정
db = pymysql.connect(
    host = os.getenv("DB_HOST"),
    user = os.getenv("DB_USER"),
    password = os.getenv("DB_PASSWORD"),
    db = os.getenv("DB_NAME"),
    charset='utf8mb4',
)

# 데이터베이스 커서 생성
cursor = db.cursor()

# 가짜 데이터 생성기 생성
fake = Faker()

# 상품 카테고리 번호와 카테고리 이름
categories = [
    (101, '남자상의'),
    (102, '남자하의'),
    (103, '남자아우터'),
    (104, '남자액세서리'),
    (105, '남자기타'),
    (201, '여자상의'),
    (202, '여자하의'),
    (203, '여자아우터'),
    (204, '여자액세서리'),
    (205, '여자기타'),
]

# 샘플 데이터 생성 및 데이터베이스에 추가
for _ in range(1000):
    user_no = random.randint(1, 10)  # 사용자 번호 (1에서 10 사이의 랜덤)
    category_no, category_name = random.choice(categories)  # 랜덤 카테고리 선택
    goods_title = fake.catch_phrase()  # 가짜 상품 제목 생성
    goods_descr = fake.paragraph(nb_sentences=3)  # 가짜 상품 설명 생성
    goods_price = random.randint(10000, 1000000)  # 가짜 상품 가격 (10000에서 1000000 사이의 랜덤)
    view_count = random.randint(0, 1000)  # 조회수 (0에서 1000 사이의 랜덤)

    # SQL 쿼리 실행
    sql = """
    INSERT INTO `goods` (`USER_NO`, `CATEGORY_NO`, `GOODS_TITLE`, `GOODS_DESCR`, `GOODS_PRICES`, `VIEW_COUNT`, `SELL_ENROLL_DT`, `GOODS_STATUS`)
    VALUES (%s, %s, %s, %s, %s, %s, NOW(), 'A')
    """
    cursor.execute(sql, (user_no, category_no, goods_title, goods_descr, goods_price, view_count))

# 변경 내용을 저장하고 연결을 닫습니다.
db.commit()
db.close()
