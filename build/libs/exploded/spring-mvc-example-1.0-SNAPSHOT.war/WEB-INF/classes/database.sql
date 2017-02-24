CREATE TABLE books (
  id          SERIAL       NOT NULL PRIMARY KEY,
  book_title  VARCHAR(255) NOT NULL,
  book_author VARCHAR(255) NOT NULL,
  book_price  FLOAT        NOT NULL
);

CREATE TABLE users (
  id       SERIAL       NOT NULL  PRIMARY KEY,
  username VARCHAR(100) NOT NULL,
  password VARCHAR(100) NOT NULL
);

CREATE TABLE roles (
  id   SERIAL       NOT NULL  PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE user_roles (
  id      SERIAL NOT NULL PRIMARY KEY,
  user_id INT    NOT NULL,
  role_id INT    NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO users (id, username, password)
VALUES ('1', 'admin', '$2a$11$ioxfivpyJWbs5mNRdoFvb.HZGEV2mbagJjkeNE6es.IkPt3X4uMPC');

INSERT INTO roles (id, name)
VALUES
('1', 'ROLE_USER'),
('2', 'ROLE_ADMIN');

INSERT INTO user_roles(user_id, role_id) VALUES ('1', '2')