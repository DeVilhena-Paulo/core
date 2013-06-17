(** A collection of iobuf access functions.  This abstracts over [Iobuf.Consume],
    [Iobuf.Fill], [Iobuf.Peek], and [Iobuf.Poke]. *)
module type Accessors = sig
  (** [('d, 'w) Iobuf.t] accessor function manipulating ['a], either writing it to the
      iobuf or reading it from the iobuf. *)
  type ('a, 'd, 'w) t

  val char                :                             (char       , 'd, 'w) t
  val  int8               :                             (int        , 'd, 'w) t
  val  int16_be           :                             (int        , 'd, 'w) t
  val  int16_le           :                             (int        , 'd, 'w) t
  val  int32_be           :                             (int        , 'd, 'w) t
  val  int32_le           :                             (int        , 'd, 'w) t
  val uint8               :                             (int        , 'd, 'w) t
  val uint16_be           :                             (int        , 'd, 'w) t
  val uint16_le           :                             (int        , 'd, 'w) t
  val uint32_be           :                             (int        , 'd, 'w) t
  val uint32_le           :                             (int        , 'd, 'w) t
  val  int64_be           :                             (int        , 'd, 'w) t
  val  int64_le           :                             (int        , 'd, 'w) t
  val  int64_t_be         :                             (Int64    .t, 'd, 'w) t
  val  int64_t_le         :                             (Int64    .t, 'd, 'w) t
  val padded_fixed_string : padding:char ->  len:int -> (   string  , 'd, 'w) t
  val              string : ?str_pos:int -> ?len:int -> (   string  , 'd, 'w) t
  val           bigstring : ?str_pos:int -> ?len:int -> (Bigstring.t, 'd, 'w) t
end

(* For use in iobuf.mli -- can't be added to Std_internal due to dependencies *)
module Unix = Core_unix
