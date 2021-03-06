# Japanese Rdoc document
#
# $Author$
# $Date$
#
# Copyright (C) 2006 KUBO Takehiro <kubo@jiubao.org>

#
class OCIHandle
end

#--
# class: OCI8
# file:  ext/oci8/oci8.c
#++
# Oracle サーバへ接続するためのクラスです。
#
# 例:
#   # emp テーブルの中身を CSV フォーマットで出力する。
#   conn = OCI8.new(ユーザ名, パスワード)
#   conn.exec('select# from emp') do |row|
#     puts row.join(',')
#   end
#
#   # バインド変数を使用しつつ PL/SQL ブロックを実行する。
#   conn = OCI8.new(ユーザ名, パスワード)
#   conn.exec('BEGIN procedure_name(:1, :2); END;',
#              1番目のパラメータの値,
#              2番目のパラメータの値)
class OCI8 < OCIHandle

  #--
  # class: OCI8
  # file:  ext/oci8/oci8.c
  #++
  # call-seq:
  #   new(username, password, dbname = nil, privilege = nil)
  #
  # username と password でもって Oracle へ接続します。ローカルのデータ
  # ベースへ接続するときは dbname を nil とし、ネットワーク経由で接続する
  # ときは dbname に TNS 名を指定してください。クライアントライブラリが
  # Oracle 10g 以上の場合は以下の書式でも接続できます。
  #
  #   //DBのホスト名またはIP:TNSリスナーのポート番号/ORACLE_SID
  #
  # 接続するのにDBA権限が必要な場合は、privilege に :SYSDBA もしくは :SYSOPER
  # を指定してください。
  #
  # 例:
  #   # ローカルのデータベースへ接続
  #   # sqlplus scott/tiger
  #   conn = OCI8.new("scott", "tiger")
  #
  #   # TNS名を指定して、ネットワーク経由で接続
  #   # sqlplus scott/tiger@orcl.world
  #   conn = OCI8.new("scott", "tiger", "orcl.world")
  #
  #   # データベースのホスト・ポート・SID名を指定して、ネットワーク経由で接続
  #   # sqlplus scott/tiger@//localhost:1521/XE
  #   conn = OCI8.new("scott", "tiger", "//localhost:1521/XE")
  #
  #   # SYSDBA権限で接続
  #   # sqlplus 'sys/change_on_install as sysdba'
  #   conn = OCI8.new("sys", "change_on_install", nil, :SYSDBA)
  #
  def initialize(username, password, dbname = nil, privilege = nil)
  end

  #--
  # class: OCI8
  # file:  ext/oci8/oci8.c
  #++
  # call-seq:
  #   logoff
  #
  # Oracleとの接続を切ります。コミットされてないトランザクションは
  # ロールバックされます。
  #
  # 例:
  #   conn = OCI8.new("scott", "tiger")
  #   ... do something ...
  #   conn.logoff
  def logoff
  end

  #--
  # class: OCI8
  # file:  ext/oci8/oci8.c
  #++
  # call-seq:
  #   parse(sql_text) -> OCI8::Cursor のインスタンス
  #
  # SQL 文の準備を行い、OCI8::Cursor のインスタンスが返します。
  def parse(sql_stmt)
  end

  #--
  # class: OCI8
  # file:  ext/oci8/oci8.c
  #++
  # call-seq:
  #   commit
  #
  # トランザクションをコミットします。
  #
  # 例:
  #   conn = OCI8.new("scott", "tiger")
  #   conn.exec("UPDATE emp SET sal = sal  # 1.1") # yahoo
  #   conn.commit
  #   conn.logoff
  def commit
  end

  #--
  # class: OCI8
  # file:  ext/oci8/oci8.c
  #++
  # call-seq:
  #   rollback
  #
  # トランザクションをロールバックします。
  #
  # 例:
  #   conn = OCI8.new("scott", "tiger")
  #   conn.exec("UPDATE emp SET sal = sal * 0.9") # boos
  #   conn.rollback
  #   conn.logoff
  def rollback
  end

  #--
  # class: OCI8
  # file:  ext/oci8/oci8.c
  #++
  # call-seq:
  #   non_blocking? -> true or false
  #
  # ブロッキング/非ブロッキングモードの状態を返します。
  # non_blocking= も参照してください。
  def non_blocking?
  end

  #--
  # class: OCI8
  # file:  ext/oci8/oci8.c
  #++
  # call-seq:
  #   non_blocking = true or false
  #
  # ブロッキング/非ブロッキングモードの状態を変更します。true のとき非ブロッキ
  # ングモードで false のときブロッキングモードです。デフォルトはブロッキン
  # グモードです。
  #
  # ブロッキングモードの場合、実行に時間のかかるSQLを実行すると、スレッドを
  # 使用していても ruby 全体がブロックされます。これは、ruby のスレッドは
  # ネイティブスレッドではないためです。
  # していない
  #
  # 非ブロッキングモードの場合、実行に時間のかかるSQLを実行しても ruby 全体
  # はブロックされません。SQL を実行しているスレッドのみがブロックします。
  # そのかわり、SQL が終了しているかどうかポーリングによってチェックしてい
  # るため、個々の SQL の実行が少し遅くなります。
  #
  # OCI8#break により、別のスレッドから実行中の SQL をキャンセルできます。
  # キャンセルされたスレッドでは例外 OCIBreak を上げます。
  #
  def non_blocking=(true_or_false)
  end

  #--
  # class: OCI8
  # file:  ext/oci8/oci8.c
  #++
  #--
  # class: OCI8
  # file:  ext/oci8/oci8.c
  #++
  # call-seq:
  #   autocommit? -> true or false
  #
  # 自動コミットのモードを戻します。デフォルト値は false です。
  # true のとき、SQL 文の実行の度にトランザクションがコミットされます。
  def autocommit?
  end

  #--
  # class: OCI8
  # file:  ext/oci8/oci8.c
  #++
  # call-seq:
  #   autocommit = true or false
  #
  # 自動コミットのモードを変更します。
  #
  # 例:
  #   conn = OCI8.new("scott", "tiger")
  #   conn.autocommit = true
  #   ... do something ...
  #   conn.logoff
  def autocommit=(true_or_false)
  end

  #--
  # class: OCI8
  # file:  ext/oci8/oci8.c
  #++
  # call-seq:
  #   long_read_len -> aFixnum   (new in 0.1.16)
  #
  # LONG 型、LONG RAW 型のカラムのフェッチサイズの最大値を取得します。
  def long_read_len
  end

  #--
  # class: OCI8
  # file:  ext/oci8/oci8.c
  #++
  # call-seq:
  #   long_read_len = aFixnum   (new in 0.1.16)
  #
  # LONG 型、LONG RAW 型のカラムのフェッチサイズの最大値を変更します。
  # デフォルト値は 65535 です。
  #
  # 例:
  #   conn = OCI8.new('scott', 'tiger'
  #   conn.long_read_len = 1000000
  #   cursor = con.exec('select content from articles where id = :1', 23478)
  #   row = cursor.fetch
  def long_read_len=(len)
  end

  #--
  # class: OCI8
  # file:  ext/oci8/oci8.c
  #++
  # call-seq:
  #   break
  #
  # 他のスレッドで実行中の SQL をキャンセルします。
  # non_blocking= も参照してください。
  def break
  end

  #--
  # class: OCI8
  # file:  ext/oci8/oci8.c
  #++
  # call-seq:
  #   prefetch_rows = aFixnum   (new in 0.1.14)
  #
  # プリフェッチ行のサイズを変更します。複数行をフェッチする時の
  # ネットワークのやりとりを少なくすることができます。
  def prefetch_rows=
  end

  module BindType
    class Base
    end

    #--
    # class: OCI8::BindType::DateTime
    # file:  ext/oci8/ocidatetime.c
    #++
    # 本クラスは、ruby の
    # DateTime[http://www.ruby-doc.org/core/classes/DateTime.html] オブジェクト
    # を Oracle の <tt>TIMESTAMP WITH TIME ZONE</tt> 型としてバインドする補助クラスです。
    #
    # == Select
    #
    # <tt>DATE</tt>、<tt>TIMESTAMP</tt>、<tt>TIMESTAMP WITH TIME ZONE</tt>、
    # <tt>TIMESTAMP WITH LOCAL TIME ZONE</tt> 型のカラムをフェッチした値は
    # DateTime[http://www.ruby-doc.org/core/classes/DateTime.html] の値とな
    # ります。Oracle のデータ型がタイムゾーンを持たない場合、セッションタイ
    # ムゾーンが使用されます。セッションタイムゾーンはデフォルトではクライア
    # ントマシンのタイムゾーンです。
    #
    # 以下のＳＱＬでセッションタイムゾーンを変更できます。
    #
    #   ALTER SESSION SET TIME_ZONE='-05:00'
    #
    # == バインド
    #
    # DateTime[http://www.ruby-doc.org/core/classes/DateTime.html]を暗黙的に
    # バインドするには次のようにします。
    #
    #   conn.exec("INSERT INTO lunar_landings(ship_name, landing_time) VALUES(:1, :2)",
    #             'Apollo 11',
    #             DateTime.parse('1969-7-20 20:17:40 00:00'))
    #
    # バインド変数 <code>:2</code> は Oracle 側では <tt>TIMESTAMP WITH TIME ZONE</tt>
    # としてバインドされます。
    #
    # 明示的にバインドするには次のようにします。
    #
    #   cursor = conn.exec("INSERT INTO lunar_landings(ship_name, landing_time) VALUES(:1, :2)")
    #   cursor.bind_param(':1', nil, String, 60)
    #   cursor.bind_param(':2', nil, DateTime)
    #   [['Apollo 11', DateTime.parse('1969-07-20 20:17:40 00:00'))],
    #    ['Apollo 12', DateTime.parse('1969-11-19 06:54:35 00:00'))],
    #    ['Apollo 14', DateTime.parse('1971-02-05 09:18:11 00:00'))],
    #    ['Apollo 15', DateTime.parse('1971-07-30 22:16:29 00:00'))],
    #    ['Apollo 16', DateTime.parse('1972-04-21 02:23:35 00:00'))],
    #    ['Apollo 17', DateTime.parse('1972-12-11 19:54:57 00:00'))]
    #   ].each do |ship_name, landing_time|
    #     cursor[':1'] = ship_name
    #     cursor[':2'] = landing_time
    #     cursor.exec
    #   end
    #   cursor.close
    #
    # バインド変数にオブジェクトを入れるとき、_year_、_mon_(または _month_)、
    # _mday_(または _day_) の３つのインスタンスメソッドを持つ任意のオ
    # ブジェクトを使うことができます。オブジェクトが _hour_, _min_, _sec_
    # または _sec_fraction_ に応答できる場合、それぞれの戻り値が時・分・
    # 秒・1秒以下の時間として使用されます。 _hour_, _min_, _sec_ または
    # _sec_fraction_ に応答できない場合は 0 です。
    # オブジェクトが _offset_ または _utc_offset_ に応答できる場合、
    # その値がタイムゾーンとして使用されます。_offset_ または _utc_offset_
    # に応答できない場合は、セッションタイムゾーンが使用されます。
    #
    # 以下に受け付けることのできる値の範囲を列挙します。
    # _year_:: -4712 to 9999 [excluding year 0]
    # _mon_ (or _month_):: 0 to 12
    # _mday_ (or _day_):: 0 to 31 [depends on the month]
    # _hour_:: 0 to 23
    # _min_:: 0 to 59
    # _sec_:: 0 to 59
    # _sec_fraction_:: 0 to (999_999_999.to_r / (24*60*60* 1_000_000_000)) [999,999,999 nanoseconds]
    # _offset_:: (-12.to_r / 24) to (14.to_r / 24) [-12:00 to +14:00]
    # _utc_offset_:: -12*3600 <= utc_offset <= 24*3600 [-12:00 to +14:00]
    #
    # バインド変数の出力値は常に
    # DateTime[http://www.ruby-doc.org/core/classes/DateTime.html]
    # です。
    #
    #   cursor = conn.exec("BEGIN :ts := current_timestamp; END")
    #   cursor.bind_param(:ts, nil, DateTime)
    #   cursor.exec
    #   cursor[:ts] # => a DateTime.
    #   cursor.close
    class DateTime < Base
    end

    #--
    # class: OCI8::BindType::IntervalYM
    # file:  ext/oci8/ocidatetime.c
    #++
    # 本クラスは、ruby の
    # Integer[http://www.ruby-doc.org/core/classes/Integer.html] オブジェクト
    # を Oracle の <tt>INTERVAL YEAR TO MONTH</tt> 型としてバインドする補助クラスです。
    #
    # == Select
    #
    # <tt>INTERVAL YEAR TO MONTH</tt> 型のカラムをフェッチした値は、
    # Integer[http://www.ruby-doc.org/core/classes/Integer.html] の値と
    # なります。この値は２つのタイムスタンプの差分を月単位で表わしたものです。
    #
    # == バインド
    #
    # <tt>INTERVAL YEAR TO MONTH</tt>は暗黙的にバインドすることはできません。
    # :interval_ym を使用して明示的にバインドしてください。
    #
    #   # 出力バインド変数
    #   cursor = conn.parse(<<-EOS)
    #     BEGIN
    #       :interval := (:ts1 - :ts2) YEAR TO MONTH;
    #     END;
    #   EOS
    #   cursor.bind_param(:interval, nil, :interval_ym)
    #   cursor.bind_param(:ts1, DateTime.parse('1969-11-19 06:54:35 00:00'))
    #   cursor.bind_param(:ts2, DateTime.parse('1969-07-20 20:17:40 00:00'))
    #   cursor.exec
    #   cursor[:interval] # => 4 (months)
    #   cursor.close
    #
    #   # 入力バインド変数
    #   cursor = conn.parse(<<-EOS)
    #     BEGIN
    #       :ts1 := :ts2 + :interval;
    #     END;
    #   EOS
    #   cursor.bind_param(:ts1, nil, DateTime)
    #   cursor.bind_param(:ts2, Date.parse('1969-11-19'))
    #   cursor.bind_param(:interval, 4, :interval_ym)
    #   cursor.exec
    #   cursor[:ts1].strftime('%Y-%m-%d') # => 1970-03-19
    #   cursor.close
    #
    class IntervalYM < Base
    end

    #--
    # class: OCI8::BindType::IntervalDS
    # file:  ext/oci8/ocidatetime.c
    #++
    # 本クラスは、ruby の
    # Rational[http://www.ruby-doc.org/core/classes/Rational.html] オブジェクト
    # を Oracle の <tt>INTERVAL DAY TO SECOND</tt> 型としてバインドする補助クラスです。
    #
    # == Select
    #
    # <tt>INTERVAL DAY TO SECOND</tt>型のカラムをフェッチした値は
    # Rational[http://www.ruby-doc.org/core/classes/Rational.html] または、
    # Integer[http://www.ruby-doc.org/core/classes/Integer.html] となります。
    # この値は
    # DateTime[http://www.ruby-doc.org/core/classes/DateTime.html]#+、
    # DateTime[http://www.ruby-doc.org/core/classes/DateTime.html]#-
    # に使用できます。
    #
    # == バインド
    #
    # <tt>INTERVAL YEAR TO MONTH</tt>を暗黙的にバインドすることはできません。
    # :interval_ds を使用して明示的にバインドしてください。
    #
    #   # 出力バインド変数
    #   ts1 = DateTime.parse('1969-11-19 06:54:35 00:00')
    #   ts2 = DateTime.parse('1969-07-20 20:17:40 00:00')
    #   cursor = conn.parse(<<-EOS)
    #     BEGIN
    #       :itv := (:ts1 - :ts2) DAY TO SECOND;
    #     END;
    #   EOS
    #   cursor.bind_param(:itv, nil, :interval_ds)
    #   cursor.bind_param(:ts1, ts1)
    #   cursor.bind_param(:ts2, ts2)
    #   cursor.exec
    #   cursor[:itv] # == ts1 - ts2
    #   cursor.close
    #
    #   # 入力バインド変数
    #   ts2 = DateTime.parse('1969-07-20 20:17:40 00:00')
    #   itv = 121 + 10.to_r/24 + 36.to_r/(24*60) + 55.to_r/(24*60*60)
    #   # 121 days, 10 hours,    36 minutes,       55 seconds
    #   cursor = conn.parse(<<-EOS)
    #     BEGIN
    #       :ts1 := :ts2 + :itv;
    #     END;
    #   EOS
    #   cursor.bind_param(:ts1, nil, DateTime)
    #   cursor.bind_param(:ts2, ts2)
    #   cursor.bind_param(:itv, itv, :interval_ds)
    #   cursor.exec
    #   cursor[:ts1].strftime('%Y-%m-%d %H:%M:%S') # => 1969-11-19 06:54:35
    #   cursor.close
    class IntervalDS < Base
    end
  end
end
