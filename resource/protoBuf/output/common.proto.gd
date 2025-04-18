# Package: proto

const GDScriptUtils = preload("res://addons/protobuf/proto/GDScriptUtils.gd")
const Message = preload("res://addons/protobuf/proto/Message.gd")

enum Resource {
	Gold = 1,
	Copper = 2,
	Energy = 3,
	Energy_Max = 4,
	VipLevel = 5,
	Gas = 26,
	PlayerLevel = 7,
	XiuWei = 8,
	Prestige = 9,
	Experience_XiuWei_Ratio = 10,
	Destroy_Equip_Ratio = 11,
	Protect_Equip_Ratio = 12,
	PetAdd_Ratio = 13,
	Player_Name = 14,
	Donate = 15,
	Wuxun = 16,
	SilverCoin = 17,
	MaxHp = 100,
	Hp = 101,
	Wu = 102,
	Nei = 103,
	Ling = 104,
	NoAtt = 105,
	NoDef = 106,
	SkillAtt = 107,
	SkillDef = 108,
	MagicAtt = 109,
	MagicDef = 110,
	Aptitude = 111,
	Exp = 112,
	Level = 113,
	Xin_Fa = 114,
	Turn_Level = 115,
	NoAtt_Ratio = 116,
	NoDef_Ratio = 117,
	SkillAtt_Ratio = 118,
	SkillDef_Ratio = 119,
	MagicAtt_Ratio = 120,
	MagicDef_Ratio = 121,
	No_Hurt_Deduct_Rate = 122,
	Skill_Hurt_Deduct_Rate = 123,
	Magic_Hurt_Deduct_Rate = 124,
	Hurt_Deduct_Ratio = 125,
	MaxHp_Ratio = 126,
	Add_Aptitude = 127,
	Prestige_Agg_Ratio = 128,
	Prestige_Def_Ratio = 129,
	BeatBack = 130,
	Resist = 131,
	Berserk = 132,
	Avoid = 133,
	UnBerserk = 134,
	UnResist = 135,
	UnAvoid = 136,
	UnBeatBack = 137,
	Hurt_ADD_Ratio = 138,
	Maic_SUCC_Ratio = 139,
	Goods_Add_Aptitude = 140,
	General_Total_Aptitude = 141,
	Merits = 142,
	BeatBackAmplify = 143,
	ResistAmplify = 144,
	BerserkAmplify = 145,
	AvoidAmplify = 146,
	UnBerserkAmplify = 147,
	UnResistAmplify = 148,
	UnAvoidAmplify = 149,
	UnBeatBackAmplify = 150,
	No_Agg_Thousand_Ratio = 151,
	No_Def_Thousand_Ratio = 152,
	Skill_Agg_Thousand_Ratio = 153,
	Skill_Def_Thousand_Ratio = 154,
	Magic_Agg_Thousand_Ratio = 155,
	Magic_Def_Thousand_Ratio = 156,
	Def_Thousand_Ratio = 205,
	Agg_Thousand_Ratio = 206,
	BerserkBuf_Radio = 157,
	MaxHp_TenThousand_Ratio = 158,
	Aptitude_Add_HP = 159,
	Aptitude_Add_Agg = 160,
	Aptitude_Add_Def = 161,
	Turn_Level_Add_HP = 162,
	Turn_Level_Add_Agg = 163,
	Turn_Level_Add_Def = 164,
	Hp_Aff_Attack_Radio = 165,
	Acu_Attr_Radio = 166,
	ShenTing = 167,
	NoHurt = 170,
	JcHurt = 171,
	ZfHurt = 172,
	NoHurtRatio = 173,
	JcHurtRatio = 174,
	ZfHurtRatio = 175,
	OriginBaseRatio = 176,
	OriginSelfRatio = 177,
	PetAnger = 178,
	UnAbnormalState = 179,
	Three_Kinds_Att = 180,
	Three_Kinds_Def = 181,
	Three_Kinds_Att_Thousand_Ratio = 182,
	Three_Kinds_Def_Thousand_Ratio = 183,
	Three_Kinds_Power = 184,
	No_Hurt_Add_Rate = 185,
	Zf_Hurt_Add_Rate = 186,
	Jc_Hurt_Add_Rate = 187,
	Cure_Add_Rate = 188,
	Cure_Deduct_Rate = 189,
	Fixed_Hurt = 190,
	Fixed_Cure = 191,
	Infiltrate = 192,
	No_Def_Infiltrate = 193,
	Jc_Def_Infiltrate = 194,
	Zf_Def_Infiltrate = 195,
	A_Fixed_No_Hurt = 196,
	A_Fixed_Jc_Hurt = 197,
	A_Fixed_Zf_Hurt = 198,
	A_Fixed_Hurt = 203,
	R_Fixed_No_Hurt = 199,
	R_Fixed_Jc_Hurt = 200,
	R_Fixed_Zf_Hurt = 201,
	R_Fixed_Hurt = 204,
	Fixed_Heal = 202,
	A_Awaken_Attr = 207,
	Mr_Agg = 208,
	Mr_Def = 209,
	Combo = 210,
	Un_Combo = 211,
	Un_BerserkBuf_Radio = 212,
	Mr_Morale = 213,
} 
 
class TestPackage_10091 extends Message:
	#1 : packetId
	var packetId: int = 0

	#2 : args
	var args: String = ""


	## Init message field values to default value
	func Init() -> void:
		self.packetId = 0
		self.args = ""

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = TestPackage_10091.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.TestPackage_10091"

	func MergeFrom(other : Message) -> void:
		if other is TestPackage_10091:
			self.packetId += other.packetId
			self.args += other.args
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.packetId != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
			GDScriptUtils.encode_varint(buffer, self.packetId)
		if self.args != "":
			GDScriptUtils.encode_tag(buffer, 2, 9)
			GDScriptUtils.encode_string(buffer, self.args)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.packetId = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_string(data, pos, self)
					self.args = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["packetId"] = self.packetId
		dict["args"] = self.args
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("packetId"):
			self.packetId = dict.get("packetId")
		if dict.has("args"):
			self.args = dict.get("args")

# =========================================

class ReqlinkPort_10092 extends Message:
	#1 : packetId
	var packetId: int = 0

	#2 : args
	var args: String = ""


	## Init message field values to default value
	func Init() -> void:
		self.packetId = 0
		self.args = ""

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = ReqlinkPort_10092.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.ReqlinkPort_10092"

	func MergeFrom(other : Message) -> void:
		if other is ReqlinkPort_10092:
			self.packetId += other.packetId
			self.args += other.args
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.packetId != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
			GDScriptUtils.encode_varint(buffer, self.packetId)
		if self.args != "":
			GDScriptUtils.encode_tag(buffer, 2, 9)
			GDScriptUtils.encode_string(buffer, self.args)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.packetId = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_string(data, pos, self)
					self.args = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["packetId"] = self.packetId
		dict["args"] = self.args
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("packetId"):
			self.packetId = dict.get("packetId")
		if dict.has("args"):
			self.args = dict.get("args")

# =========================================

class ResDto extends Message:
	#1 : res
	var res: Resource = 0

	#2 : num
	var num: int = 0

	#3 : resId
	var resId: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.res = 0
		self.num = 0
		self.resId = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = ResDto.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.ResDto"

	func MergeFrom(other : Message) -> void:
		if other is ResDto:
			self.res = other.res
			self.num += other.num
			self.resId += other.resId
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.res != 0:
			GDScriptUtils.encode_tag(buffer, 1, 14)
			GDScriptUtils.encode_varint(buffer, self.res)
		if self.num != 0:
			GDScriptUtils.encode_tag(buffer, 2, 3)
			GDScriptUtils.encode_varint(buffer, self.num)
		if self.resId != 0:
			GDScriptUtils.encode_tag(buffer, 3, 5)
			GDScriptUtils.encode_varint(buffer, self.resId)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.res = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.num = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				3:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.resId = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["res"] = self.res
		dict["num"] = self.num
		dict["resId"] = self.resId
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("res"):
			self.res = dict.get("res")
		if dict.has("num"):
			self.num = dict.get("num")
		if dict.has("resId"):
			self.resId = dict.get("resId")

# =========================================

class GoodsReward extends Message:
	#1 : configId
	var configId: int = 0

	#2 : num
	var num: int = 0

	#3 : isRandom
	var isRandom: bool = false


	## Init message field values to default value
	func Init() -> void:
		self.configId = 0
		self.num = 0
		self.isRandom = false

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = GoodsReward.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.GoodsReward"

	func MergeFrom(other : Message) -> void:
		if other is GoodsReward:
			self.configId += other.configId
			self.num += other.num
			self.isRandom = other.isRandom
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.configId != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
			GDScriptUtils.encode_varint(buffer, self.configId)
		if self.num != 0:
			GDScriptUtils.encode_tag(buffer, 2, 5)
			GDScriptUtils.encode_varint(buffer, self.num)
		if self.isRandom != false:
			GDScriptUtils.encode_tag(buffer, 3, 8)
			GDScriptUtils.encode_bool(buffer, self.isRandom)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.configId = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.num = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				3:
					var field_value = GDScriptUtils.decode_bool(data, pos, self)
					self.isRandom = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["configId"] = self.configId
		dict["num"] = self.num
		dict["isRandom"] = self.isRandom
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("configId"):
			self.configId = dict.get("configId")
		if dict.has("num"):
			self.num = dict.get("num")
		if dict.has("isRandom"):
			self.isRandom = dict.get("isRandom")

# =========================================

class GoodsOdds extends Message:
	#1 : goodsId
	var goodsId: int = 0

	#2 : odds
	var odds: int = 0

	#3 : num
	var num: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.goodsId = 0
		self.odds = 0
		self.num = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = GoodsOdds.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.GoodsOdds"

	func MergeFrom(other : Message) -> void:
		if other is GoodsOdds:
			self.goodsId += other.goodsId
			self.odds += other.odds
			self.num += other.num
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.goodsId != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
			GDScriptUtils.encode_varint(buffer, self.goodsId)
		if self.odds != 0:
			GDScriptUtils.encode_tag(buffer, 2, 5)
			GDScriptUtils.encode_varint(buffer, self.odds)
		if self.num != 0:
			GDScriptUtils.encode_tag(buffer, 3, 5)
			GDScriptUtils.encode_varint(buffer, self.num)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.goodsId = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.odds = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				3:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.num = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["goodsId"] = self.goodsId
		dict["odds"] = self.odds
		dict["num"] = self.num
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("goodsId"):
			self.goodsId = dict.get("goodsId")
		if dict.has("odds"):
			self.odds = dict.get("odds")
		if dict.has("num"):
			self.num = dict.get("num")

# =========================================

class RespResource_10007 extends Message:
	#1 : list
	var _list: Array[ResDto] = []
	var _list_size: int = 0
	## Size of _list
	func list_size() -> int:
		return self._list_size
	## Get _list
	func list() -> Array[ResDto]:
		return self._list.slice(0, self._list_size)
	## Get _list item 
	func get_list(index: int) -> ResDto: # index begin from 1
		if index > 0 and index <= _list_size and index <= _list.size():
			return self._list[index - 1]
		return null
	## Add _list
	func add_list(item: ResDto) -> ResDto:
		if self._list_size >= 0 and self._list_size < self._list.size():
			self._list[self._list_size] = item
		else:
			self._list.append(item)
		self._list_size += 1
		return item
	## Append _list
	func append_list(item_array: Array):
		for item in item_array:
			if item is ResDto:
				self.add_list(item)
	## Clean _list 
	func clear_list() -> void:
		self._list_size = 0


	## Init message field values to default value
	func Init() -> void:
		self.clear_list

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = RespResource_10007.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.RespResource_10007"

	func MergeFrom(other : Message) -> void:
		if other is RespResource_10007:
			self._list = self._list.slice(0, _list_size)
			self._list.append_array(other._list.slice(0, other._list_size))
			self._list_size += other._list_size
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		for item in self._list:
			GDScriptUtils.encode_tag(buffer, 1, 11)
			GDScriptUtils.encode_message(buffer, item)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					var sub__list = ResDto.new()
					var field_value = GDScriptUtils.decode_message(data, pos, sub__list)
					self.add_list(field_value[GDScriptUtils.VALUE_KEY])
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["list"] = []
		for index in range(1, self._list_size + 1):
			var item = self.get_list(index)
			dict["list"].append(item.SerializeToDictionary())
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		self.clear_list()
		if dict.has("list"):
			var list = dict["list"]
			for item in list:
				var item_msg = ResDto.new()
				item_msg.ParseFromDictionary(item)
				self.add_list(item_msg)

# =========================================

class ReqOpenAQueue_16022 extends Message:
	#1 : queueTypeId
	var queueTypeId: int = 0

	#2 : isComfirm
	var isComfirm: bool = false


	## Init message field values to default value
	func Init() -> void:
		self.queueTypeId = 0
		self.isComfirm = false

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = ReqOpenAQueue_16022.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.ReqOpenAQueue_16022"

	func MergeFrom(other : Message) -> void:
		if other is ReqOpenAQueue_16022:
			self.queueTypeId += other.queueTypeId
			self.isComfirm = other.isComfirm
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.queueTypeId != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
			GDScriptUtils.encode_varint(buffer, self.queueTypeId)
		if self.isComfirm != false:
			GDScriptUtils.encode_tag(buffer, 2, 8)
			GDScriptUtils.encode_bool(buffer, self.isComfirm)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.queueTypeId = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_bool(data, pos, self)
					self.isComfirm = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["queueTypeId"] = self.queueTypeId
		dict["isComfirm"] = self.isComfirm
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("queueTypeId"):
			self.queueTypeId = dict.get("queueTypeId")
		if dict.has("isComfirm"):
			self.isComfirm = dict.get("isComfirm")

# =========================================

class RespQueue_16023 extends Message:
	#1 : dtos
	var _dtos: Array[QueueDto] = []
	var _dtos_size: int = 0
	## Size of _dtos
	func dtos_size() -> int:
		return self._dtos_size
	## Get _dtos
	func dtos() -> Array[QueueDto]:
		return self._dtos.slice(0, self._dtos_size)
	## Get _dtos item 
	func get_dtos(index: int) -> QueueDto: # index begin from 1
		if index > 0 and index <= _dtos_size and index <= _dtos.size():
			return self._dtos[index - 1]
		return null
	## Add _dtos
	func add_dtos(item: QueueDto) -> QueueDto:
		if self._dtos_size >= 0 and self._dtos_size < self._dtos.size():
			self._dtos[self._dtos_size] = item
		else:
			self._dtos.append(item)
		self._dtos_size += 1
		return item
	## Append _dtos
	func append_dtos(item_array: Array):
		for item in item_array:
			if item is QueueDto:
				self.add_dtos(item)
	## Clean _dtos 
	func clear_dtos() -> void:
		self._dtos_size = 0


	## Init message field values to default value
	func Init() -> void:
		self.clear_dtos

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = RespQueue_16023.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.RespQueue_16023"

	func MergeFrom(other : Message) -> void:
		if other is RespQueue_16023:
			self._dtos = self._dtos.slice(0, _dtos_size)
			self._dtos.append_array(other._dtos.slice(0, other._dtos_size))
			self._dtos_size += other._dtos_size
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		for item in self._dtos:
			GDScriptUtils.encode_tag(buffer, 1, 11)
			GDScriptUtils.encode_message(buffer, item)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					var sub__dtos = QueueDto.new()
					var field_value = GDScriptUtils.decode_message(data, pos, sub__dtos)
					self.add_dtos(field_value[GDScriptUtils.VALUE_KEY])
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["dtos"] = []
		for index in range(1, self._dtos_size + 1):
			var item = self.get_dtos(index)
			dict["dtos"].append(item.SerializeToDictionary())
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		self.clear_dtos()
		if dict.has("dtos"):
			var list = dict["dtos"]
			for item in list:
				var item_msg = QueueDto.new()
				item_msg.ParseFromDictionary(item)
				self.add_dtos(item_msg)

# =========================================

class ReqCostForQueue_16024 extends Message:
	#1 : queueTypeId
	var queueTypeId: int = 0

	#2 : index
	var index: int = 0

	#3 : isComfirm
	var isComfirm: bool = false


	## Init message field values to default value
	func Init() -> void:
		self.queueTypeId = 0
		self.index = 0
		self.isComfirm = false

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = ReqCostForQueue_16024.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.ReqCostForQueue_16024"

	func MergeFrom(other : Message) -> void:
		if other is ReqCostForQueue_16024:
			self.queueTypeId += other.queueTypeId
			self.index += other.index
			self.isComfirm = other.isComfirm
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.queueTypeId != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
			GDScriptUtils.encode_varint(buffer, self.queueTypeId)
		if self.index != 0:
			GDScriptUtils.encode_tag(buffer, 2, 5)
			GDScriptUtils.encode_varint(buffer, self.index)
		if self.isComfirm != false:
			GDScriptUtils.encode_tag(buffer, 3, 8)
			GDScriptUtils.encode_bool(buffer, self.isComfirm)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.queueTypeId = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.index = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				3:
					var field_value = GDScriptUtils.decode_bool(data, pos, self)
					self.isComfirm = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["queueTypeId"] = self.queueTypeId
		dict["index"] = self.index
		dict["isComfirm"] = self.isComfirm
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("queueTypeId"):
			self.queueTypeId = dict.get("queueTypeId")
		if dict.has("index"):
			self.index = dict.get("index")
		if dict.has("isComfirm"):
			self.isComfirm = dict.get("isComfirm")

# =========================================

class ReqAllCostForQueue_16026 extends Message:
	#1 : queueTypeId
	var _queueTypeId: Array[int] = []
	var _queueTypeId_size: int = 0
	## Size of _queueTypeId
	func queueTypeId_size() -> int:
		return self._queueTypeId_size
	## Get _queueTypeId
	func queueTypeId() -> Array[int]:
		return self._queueTypeId.slice(0, self._queueTypeId_size)
	## Get _queueTypeId item 
	func get_queueTypeId(index: int) -> int: # index begin from 1
		if index > 0 and index <= _queueTypeId_size and index <= _queueTypeId.size():
			return self._queueTypeId[index - 1]
		return 0
	## Add _queueTypeId
	func add_queueTypeId(item: int) -> int:
		if self._queueTypeId_size >= 0 and self._queueTypeId_size < self._queueTypeId.size():
			self._queueTypeId[self._queueTypeId_size] = item
		else:
			self._queueTypeId.append(item)
		self._queueTypeId_size += 1
		return item
	## Append _queueTypeId
	func append_queueTypeId(item_array: Array):
		for item in item_array:
			if item is int:
				self.add_queueTypeId(item)
	## Clean _queueTypeId 
	func clear_queueTypeId() -> void:
		self._queueTypeId_size = 0

	#2 : isComfirm
	var isComfirm: bool = false


	## Init message field values to default value
	func Init() -> void:
		self.clear_queueTypeId
		self.isComfirm = false

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = ReqAllCostForQueue_16026.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.ReqAllCostForQueue_16026"

	func MergeFrom(other : Message) -> void:
		if other is ReqAllCostForQueue_16026:
			self._queueTypeId = self._queueTypeId.slice(0, _queueTypeId_size)
			self._queueTypeId.append_array(other._queueTypeId.slice(0, other._queueTypeId_size))
			self._queueTypeId_size += other._queueTypeId_size
			self.isComfirm = other.isComfirm
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		for item in self._queueTypeId:
			GDScriptUtils.encode_tag(buffer, 1, 5)
			GDScriptUtils.encode_varint(buffer, item)
		if self.isComfirm != false:
			GDScriptUtils.encode_tag(buffer, 2, 8)
			GDScriptUtils.encode_bool(buffer, self.isComfirm)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.add_queueTypeId(field_value[GDScriptUtils.VALUE_KEY])
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_bool(data, pos, self)
					self.isComfirm = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["queueTypeId"] = self._queueTypeId
		dict["isComfirm"] = self.isComfirm
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		self.clear_queueTypeId()
		if dict.has("queueTypeId"):
			var list = dict["queueTypeId"]
			for item in list:
				self.add_queueTypeId(item)
		if dict.has("isComfirm"):
			self.isComfirm = dict.get("isComfirm")

# =========================================

class ReqBuyQueue_16025 extends Message:
	#1 : queueTypeId
	var queueTypeId: int = 0

	#2 : index
	var index: int = 0

	#3 : isComfirm
	var isComfirm: bool = false


	## Init message field values to default value
	func Init() -> void:
		self.queueTypeId = 0
		self.index = 0
		self.isComfirm = false

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = ReqBuyQueue_16025.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.ReqBuyQueue_16025"

	func MergeFrom(other : Message) -> void:
		if other is ReqBuyQueue_16025:
			self.queueTypeId += other.queueTypeId
			self.index += other.index
			self.isComfirm = other.isComfirm
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.queueTypeId != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
			GDScriptUtils.encode_varint(buffer, self.queueTypeId)
		if self.index != 0:
			GDScriptUtils.encode_tag(buffer, 2, 5)
			GDScriptUtils.encode_varint(buffer, self.index)
		if self.isComfirm != false:
			GDScriptUtils.encode_tag(buffer, 3, 8)
			GDScriptUtils.encode_bool(buffer, self.isComfirm)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.queueTypeId = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.index = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				3:
					var field_value = GDScriptUtils.decode_bool(data, pos, self)
					self.isComfirm = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["queueTypeId"] = self.queueTypeId
		dict["index"] = self.index
		dict["isComfirm"] = self.isComfirm
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("queueTypeId"):
			self.queueTypeId = dict.get("queueTypeId")
		if dict.has("index"):
			self.index = dict.get("index")
		if dict.has("isComfirm"):
			self.isComfirm = dict.get("isComfirm")

# =========================================

class QueueDto extends Message:
	#1 : queueTypeId
	var queueTypeId: int = 0

	#2 : index
	var index: int = 0

	#3 : cdTime
	var cdTime: int = 0

	#4 : limitTime
	var limitTime: int = 0

	#5 : isFreezed
	var isFreezed: bool = false

	#6 : unFreezeTime
	var unFreezeTime: int = 0

	#7 : customTitle
	var customTitle: String = ""

	#8 : buy
	var buy: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.queueTypeId = 0
		self.index = 0
		self.cdTime = 0
		self.limitTime = 0
		self.isFreezed = false
		self.unFreezeTime = 0
		self.customTitle = ""
		self.buy = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = QueueDto.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.QueueDto"

	func MergeFrom(other : Message) -> void:
		if other is QueueDto:
			self.queueTypeId += other.queueTypeId
			self.index += other.index
			self.cdTime += other.cdTime
			self.limitTime += other.limitTime
			self.isFreezed = other.isFreezed
			self.unFreezeTime += other.unFreezeTime
			self.customTitle += other.customTitle
			self.buy += other.buy
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.queueTypeId != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
			GDScriptUtils.encode_varint(buffer, self.queueTypeId)
		if self.index != 0:
			GDScriptUtils.encode_tag(buffer, 2, 5)
			GDScriptUtils.encode_varint(buffer, self.index)
		if self.cdTime != 0:
			GDScriptUtils.encode_tag(buffer, 3, 3)
			GDScriptUtils.encode_varint(buffer, self.cdTime)
		if self.limitTime != 0:
			GDScriptUtils.encode_tag(buffer, 4, 3)
			GDScriptUtils.encode_varint(buffer, self.limitTime)
		if self.isFreezed != false:
			GDScriptUtils.encode_tag(buffer, 5, 8)
			GDScriptUtils.encode_bool(buffer, self.isFreezed)
		if self.unFreezeTime != 0:
			GDScriptUtils.encode_tag(buffer, 6, 3)
			GDScriptUtils.encode_varint(buffer, self.unFreezeTime)
		if self.customTitle != "":
			GDScriptUtils.encode_tag(buffer, 7, 9)
			GDScriptUtils.encode_string(buffer, self.customTitle)
		if self.buy != 0:
			GDScriptUtils.encode_tag(buffer, 8, 5)
			GDScriptUtils.encode_varint(buffer, self.buy)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.queueTypeId = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.index = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				3:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.cdTime = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				4:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.limitTime = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				5:
					var field_value = GDScriptUtils.decode_bool(data, pos, self)
					self.isFreezed = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				6:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.unFreezeTime = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				7:
					var field_value = GDScriptUtils.decode_string(data, pos, self)
					self.customTitle = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				8:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.buy = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["queueTypeId"] = self.queueTypeId
		dict["index"] = self.index
		dict["cdTime"] = self.cdTime
		dict["limitTime"] = self.limitTime
		dict["isFreezed"] = self.isFreezed
		dict["unFreezeTime"] = self.unFreezeTime
		dict["customTitle"] = self.customTitle
		dict["buy"] = self.buy
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("queueTypeId"):
			self.queueTypeId = dict.get("queueTypeId")
		if dict.has("index"):
			self.index = dict.get("index")
		if dict.has("cdTime"):
			self.cdTime = dict.get("cdTime")
		if dict.has("limitTime"):
			self.limitTime = dict.get("limitTime")
		if dict.has("isFreezed"):
			self.isFreezed = dict.get("isFreezed")
		if dict.has("unFreezeTime"):
			self.unFreezeTime = dict.get("unFreezeTime")
		if dict.has("customTitle"):
			self.customTitle = dict.get("customTitle")
		if dict.has("buy"):
			self.buy = dict.get("buy")

# =========================================

class RespCommonResponse_10009 extends Message:
	#1 : packetId
	var packetId: int = 0

	#2 : values
	var values: String = ""


	## Init message field values to default value
	func Init() -> void:
		self.packetId = 0
		self.values = ""

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = RespCommonResponse_10009.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.RespCommonResponse_10009"

	func MergeFrom(other : Message) -> void:
		if other is RespCommonResponse_10009:
			self.packetId += other.packetId
			self.values += other.values
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.packetId != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
			GDScriptUtils.encode_varint(buffer, self.packetId)
		if self.values != "":
			GDScriptUtils.encode_tag(buffer, 2, 9)
			GDScriptUtils.encode_string(buffer, self.values)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.packetId = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_string(data, pos, self)
					self.values = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["packetId"] = self.packetId
		dict["values"] = self.values
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("packetId"):
			self.packetId = dict.get("packetId")
		if dict.has("values"):
			self.values = dict.get("values")

# =========================================

class Rewards extends Message:
	#1 : rewards
	var _rewards: Array[GoodsReward] = []
	var _rewards_size: int = 0
	## Size of _rewards
	func rewards_size() -> int:
		return self._rewards_size
	## Get _rewards
	func rewards() -> Array[GoodsReward]:
		return self._rewards.slice(0, self._rewards_size)
	## Get _rewards item 
	func get_rewards(index: int) -> GoodsReward: # index begin from 1
		if index > 0 and index <= _rewards_size and index <= _rewards.size():
			return self._rewards[index - 1]
		return null
	## Add _rewards
	func add_rewards(item: GoodsReward) -> GoodsReward:
		if self._rewards_size >= 0 and self._rewards_size < self._rewards.size():
			self._rewards[self._rewards_size] = item
		else:
			self._rewards.append(item)
		self._rewards_size += 1
		return item
	## Append _rewards
	func append_rewards(item_array: Array):
		for item in item_array:
			if item is GoodsReward:
				self.add_rewards(item)
	## Clean _rewards 
	func clear_rewards() -> void:
		self._rewards_size = 0

	#2 : res
	var _res: Array[ResDto] = []
	var _res_size: int = 0
	## Size of _res
	func res_size() -> int:
		return self._res_size
	## Get _res
	func res() -> Array[ResDto]:
		return self._res.slice(0, self._res_size)
	## Get _res item 
	func get_res(index: int) -> ResDto: # index begin from 1
		if index > 0 and index <= _res_size and index <= _res.size():
			return self._res[index - 1]
		return null
	## Add _res
	func add_res(item: ResDto) -> ResDto:
		if self._res_size >= 0 and self._res_size < self._res.size():
			self._res[self._res_size] = item
		else:
			self._res.append(item)
		self._res_size += 1
		return item
	## Append _res
	func append_res(item_array: Array):
		for item in item_array:
			if item is ResDto:
				self.add_res(item)
	## Clean _res 
	func clear_res() -> void:
		self._res_size = 0


	## Init message field values to default value
	func Init() -> void:
		self.clear_rewards
		self.clear_res

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = Rewards.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.Rewards"

	func MergeFrom(other : Message) -> void:
		if other is Rewards:
			self._rewards = self._rewards.slice(0, _rewards_size)
			self._rewards.append_array(other._rewards.slice(0, other._rewards_size))
			self._rewards_size += other._rewards_size
			self._res = self._res.slice(0, _res_size)
			self._res.append_array(other._res.slice(0, other._res_size))
			self._res_size += other._res_size
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		for item in self._rewards:
			GDScriptUtils.encode_tag(buffer, 1, 11)
			GDScriptUtils.encode_message(buffer, item)
		for item in self._res:
			GDScriptUtils.encode_tag(buffer, 2, 11)
			GDScriptUtils.encode_message(buffer, item)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					var sub__rewards = GoodsReward.new()
					var field_value = GDScriptUtils.decode_message(data, pos, sub__rewards)
					self.add_rewards(field_value[GDScriptUtils.VALUE_KEY])
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var sub__res = ResDto.new()
					var field_value = GDScriptUtils.decode_message(data, pos, sub__res)
					self.add_res(field_value[GDScriptUtils.VALUE_KEY])
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["rewards"] = []
		for index in range(1, self._rewards_size + 1):
			var item = self.get_rewards(index)
			dict["rewards"].append(item.SerializeToDictionary())
		dict["res"] = []
		for index in range(1, self._res_size + 1):
			var item = self.get_res(index)
			dict["res"].append(item.SerializeToDictionary())
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		self.clear_rewards()
		if dict.has("rewards"):
			var list = dict["rewards"]
			for item in list:
				var item_msg = GoodsReward.new()
				item_msg.ParseFromDictionary(item)
				self.add_rewards(item_msg)
		self.clear_res()
		if dict.has("res"):
			var list = dict["res"]
			for item in list:
				var item_msg = ResDto.new()
				item_msg.ParseFromDictionary(item)
				self.add_res(item_msg)

# =========================================

class AwardConfig extends Message:
	#1 : id
	var id: int = 0

	#2 : title
	var title: String = ""

	#3 : awards
	var awards: String = ""

	#4 : showEffect
	var showEffect: int = 0

	#5 : param1
	var param1: String = ""


	## Init message field values to default value
	func Init() -> void:
		self.id = 0
		self.title = ""
		self.awards = ""
		self.showEffect = 0
		self.param1 = ""

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = AwardConfig.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.AwardConfig"

	func MergeFrom(other : Message) -> void:
		if other is AwardConfig:
			self.id += other.id
			self.title += other.title
			self.awards += other.awards
			self.showEffect += other.showEffect
			self.param1 += other.param1
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.id != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
			GDScriptUtils.encode_varint(buffer, self.id)
		if self.title != "":
			GDScriptUtils.encode_tag(buffer, 2, 9)
			GDScriptUtils.encode_string(buffer, self.title)
		if self.awards != "":
			GDScriptUtils.encode_tag(buffer, 3, 9)
			GDScriptUtils.encode_string(buffer, self.awards)
		if self.showEffect != 0:
			GDScriptUtils.encode_tag(buffer, 4, 5)
			GDScriptUtils.encode_varint(buffer, self.showEffect)
		if self.param1 != "":
			GDScriptUtils.encode_tag(buffer, 5, 9)
			GDScriptUtils.encode_string(buffer, self.param1)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.id = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_string(data, pos, self)
					self.title = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				3:
					var field_value = GDScriptUtils.decode_string(data, pos, self)
					self.awards = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				4:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.showEffect = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				5:
					var field_value = GDScriptUtils.decode_string(data, pos, self)
					self.param1 = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["id"] = self.id
		dict["title"] = self.title
		dict["awards"] = self.awards
		dict["showEffect"] = self.showEffect
		dict["param1"] = self.param1
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("id"):
			self.id = dict.get("id")
		if dict.has("title"):
			self.title = dict.get("title")
		if dict.has("awards"):
			self.awards = dict.get("awards")
		if dict.has("showEffect"):
			self.showEffect = dict.get("showEffect")
		if dict.has("param1"):
			self.param1 = dict.get("param1")

# =========================================

class RespAvoidAddiction_10014 extends Message:
	#1 : onlineTime
	var onlineTime: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.onlineTime = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = RespAvoidAddiction_10014.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.RespAvoidAddiction_10014"

	func MergeFrom(other : Message) -> void:
		if other is RespAvoidAddiction_10014:
			self.onlineTime += other.onlineTime
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.onlineTime != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
			GDScriptUtils.encode_varint(buffer, self.onlineTime)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.onlineTime = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["onlineTime"] = self.onlineTime
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("onlineTime"):
			self.onlineTime = dict.get("onlineTime")

# =========================================

class RespOpenActivity_20320 extends Message:
	#1 : openId
	var openId: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.openId = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = RespOpenActivity_20320.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.RespOpenActivity_20320"

	func MergeFrom(other : Message) -> void:
		if other is RespOpenActivity_20320:
			self.openId += other.openId
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.openId != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
			GDScriptUtils.encode_varint(buffer, self.openId)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.openId = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["openId"] = self.openId
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("openId"):
			self.openId = dict.get("openId")

# =========================================

class ReqRandomGameNum_20322 extends Message:
	#1 : type
	var type: int = 0

	#2 : value
	var value: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.type = 0
		self.value = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = ReqRandomGameNum_20322.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.ReqRandomGameNum_20322"

	func MergeFrom(other : Message) -> void:
		if other is ReqRandomGameNum_20322:
			self.type += other.type
			self.value += other.value
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.type != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
			GDScriptUtils.encode_varint(buffer, self.type)
		if self.value != 0:
			GDScriptUtils.encode_tag(buffer, 2, 5)
			GDScriptUtils.encode_varint(buffer, self.value)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.type = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.value = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["type"] = self.type
		dict["value"] = self.value
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("type"):
			self.type = dict.get("type")
		if dict.has("value"):
			self.value = dict.get("value")

# =========================================

class RespRandomGameNum_20323 extends Message:
	#1 : type
	var type: int = 0

	#2 : value
	var value: int = 0

	#3 : success
	var success: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.type = 0
		self.value = 0
		self.success = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = RespRandomGameNum_20323.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.RespRandomGameNum_20323"

	func MergeFrom(other : Message) -> void:
		if other is RespRandomGameNum_20323:
			self.type += other.type
			self.value += other.value
			self.success += other.success
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.type != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
			GDScriptUtils.encode_varint(buffer, self.type)
		if self.value != 0:
			GDScriptUtils.encode_tag(buffer, 2, 5)
			GDScriptUtils.encode_varint(buffer, self.value)
		if self.success != 0:
			GDScriptUtils.encode_tag(buffer, 3, 5)
			GDScriptUtils.encode_varint(buffer, self.success)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.type = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.value = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				3:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.success = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["type"] = self.type
		dict["value"] = self.value
		dict["success"] = self.success
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("type"):
			self.type = dict.get("type")
		if dict.has("value"):
			self.value = dict.get("value")
		if dict.has("success"):
			self.success = dict.get("success")

# =========================================

class RespPlayerPhotoMain_12212 extends Message:
	#1 : gmIds
	var gmIds: String = ""


	## Init message field values to default value
	func Init() -> void:
		self.gmIds = ""

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = RespPlayerPhotoMain_12212.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.RespPlayerPhotoMain_12212"

	func MergeFrom(other : Message) -> void:
		if other is RespPlayerPhotoMain_12212:
			self.gmIds += other.gmIds
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.gmIds != "":
			GDScriptUtils.encode_tag(buffer, 1, 9)
			GDScriptUtils.encode_string(buffer, self.gmIds)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					var field_value = GDScriptUtils.decode_string(data, pos, self)
					self.gmIds = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["gmIds"] = self.gmIds
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("gmIds"):
			self.gmIds = dict.get("gmIds")

# =========================================

class ReqPlayerPhotoUse_12213 extends Message:
	#1 : gmId
	var gmId: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.gmId = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = ReqPlayerPhotoUse_12213.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.ReqPlayerPhotoUse_12213"

	func MergeFrom(other : Message) -> void:
		if other is ReqPlayerPhotoUse_12213:
			self.gmId += other.gmId
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.gmId != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
			GDScriptUtils.encode_varint(buffer, self.gmId)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.gmId = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["gmId"] = self.gmId
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("gmId"):
			self.gmId = dict.get("gmId")

# =========================================

class ActivityInfo extends Message:
	#1 : enable
	var enable: bool = false

	#2 : num1
	var num1: int = 0

	#3 : num2
	var num2: int = 0

	#4 : params
	var params: String = ""


	## Init message field values to default value
	func Init() -> void:
		self.enable = false
		self.num1 = 0
		self.num2 = 0
		self.params = ""

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = ActivityInfo.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.ActivityInfo"

	func MergeFrom(other : Message) -> void:
		if other is ActivityInfo:
			self.enable = other.enable
			self.num1 += other.num1
			self.num2 += other.num2
			self.params += other.params
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.enable != false:
			GDScriptUtils.encode_tag(buffer, 1, 8)
			GDScriptUtils.encode_bool(buffer, self.enable)
		if self.num1 != 0:
			GDScriptUtils.encode_tag(buffer, 2, 5)
			GDScriptUtils.encode_varint(buffer, self.num1)
		if self.num2 != 0:
			GDScriptUtils.encode_tag(buffer, 3, 5)
			GDScriptUtils.encode_varint(buffer, self.num2)
		if self.params != "":
			GDScriptUtils.encode_tag(buffer, 4, 9)
			GDScriptUtils.encode_string(buffer, self.params)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					var field_value = GDScriptUtils.decode_bool(data, pos, self)
					self.enable = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.num1 = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				3:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.num2 = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				4:
					var field_value = GDScriptUtils.decode_string(data, pos, self)
					self.params = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["enable"] = self.enable
		dict["num1"] = self.num1
		dict["num2"] = self.num2
		dict["params"] = self.params
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("enable"):
			self.enable = dict.get("enable")
		if dict.has("num1"):
			self.num1 = dict.get("num1")
		if dict.has("num2"):
			self.num2 = dict.get("num2")
		if dict.has("params"):
			self.params = dict.get("params")

# =========================================

class RespBatchBuyInfo_13202 extends Message:
	#1 : type
	var type: int = 0

	#2 : price
	var _price: Array[int] = []
	var _price_size: int = 0
	## Size of _price
	func price_size() -> int:
		return self._price_size
	## Get _price
	func price() -> Array[int]:
		return self._price.slice(0, self._price_size)
	## Get _price item 
	func get_price(index: int) -> int: # index begin from 1
		if index > 0 and index <= _price_size and index <= _price.size():
			return self._price[index - 1]
		return 0
	## Add _price
	func add_price(item: int) -> int:
		if self._price_size >= 0 and self._price_size < self._price.size():
			self._price[self._price_size] = item
		else:
			self._price.append(item)
		self._price_size += 1
		return item
	## Append _price
	func append_price(item_array: Array):
		for item in item_array:
			if item is int:
				self.add_price(item)
	## Clean _price 
	func clear_price() -> void:
		self._price_size = 0


	## Init message field values to default value
	func Init() -> void:
		self.type = 0
		self.clear_price

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = RespBatchBuyInfo_13202.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.RespBatchBuyInfo_13202"

	func MergeFrom(other : Message) -> void:
		if other is RespBatchBuyInfo_13202:
			self.type += other.type
			self._price = self._price.slice(0, _price_size)
			self._price.append_array(other._price.slice(0, other._price_size))
			self._price_size += other._price_size
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.type != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
			GDScriptUtils.encode_varint(buffer, self.type)
		for item in self._price:
			GDScriptUtils.encode_tag(buffer, 2, 5)
			GDScriptUtils.encode_varint(buffer, item)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.type = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.add_price(field_value[GDScriptUtils.VALUE_KEY])
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["type"] = self.type
		dict["price"] = self._price
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("type"):
			self.type = dict.get("type")
		self.clear_price()
		if dict.has("price"):
			var list = dict["price"]
			for item in list:
				self.add_price(item)

# =========================================

class ReqCommonOtherFreeSet_13209 extends Message:
	#1 : key
	var key: int = 0

	#2 : set
	var set: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.key = 0
		self.set = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = ReqCommonOtherFreeSet_13209.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.ReqCommonOtherFreeSet_13209"

	func MergeFrom(other : Message) -> void:
		if other is ReqCommonOtherFreeSet_13209:
			self.key += other.key
			self.set += other.set
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.key != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
			GDScriptUtils.encode_varint(buffer, self.key)
		if self.set != 0:
			GDScriptUtils.encode_tag(buffer, 2, 5)
			GDScriptUtils.encode_varint(buffer, self.set)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.key = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.set = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["key"] = self.key
		dict["set"] = self.set
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("key"):
			self.key = dict.get("key")
		if dict.has("set"):
			self.set = dict.get("set")

# =========================================

class RespAppearanceMain_13230 extends Message:
	#1 : appInfo
	var appInfo: AppearanceInfo = null


	## Init message field values to default value
	func Init() -> void:
		if self.appInfo != null:			self.appInfo.clear()

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = RespAppearanceMain_13230.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.RespAppearanceMain_13230"

	func MergeFrom(other : Message) -> void:
		if other is RespAppearanceMain_13230:
			if other.appInfo != null:
				if self.appInfo == null:
					self.appInfo = AppearanceInfo.new()
				self.appInfo.MergeFrom(other.appInfo)
			else:
				self.appInfo = null
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.appInfo != null:
			GDScriptUtils.encode_tag(buffer, 1, 11)
			GDScriptUtils.encode_message(buffer, self.appInfo)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					if self.appInfo == null:
						self.appInfo = AppearanceInfo.new()
					self.appInfo.Init()
					var field_value = GDScriptUtils.decode_message(data, pos, self.appInfo)
					self.appInfo = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		if self.appInfo != null:
			dict["appInfo"] = self.appInfo.SerializeToDictionary()
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("appInfo"):
			if self.appInfo == null:
				self.appInfo = AppearanceInfo.new()
			self.appInfo.Init()
			self.appInfo.ParseFromDictionary(dict.get("appInfo"))
		else:
			self.appInfo = null

# =========================================

class ReqAppearanceMain_13231 extends Message:
	#1 : type
	var type: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.type = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = ReqAppearanceMain_13231.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.ReqAppearanceMain_13231"

	func MergeFrom(other : Message) -> void:
		if other is ReqAppearanceMain_13231:
			self.type += other.type
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.type != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
			GDScriptUtils.encode_varint(buffer, self.type)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.type = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["type"] = self.type
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("type"):
			self.type = dict.get("type")

# =========================================

class ReqAppearanceSelect_13232 extends Message:
	#1 : type
	var type: int = 0

	#2 : id
	var id: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.type = 0
		self.id = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = ReqAppearanceSelect_13232.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.ReqAppearanceSelect_13232"

	func MergeFrom(other : Message) -> void:
		if other is ReqAppearanceSelect_13232:
			self.type += other.type
			self.id += other.id
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.type != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
			GDScriptUtils.encode_varint(buffer, self.type)
		if self.id != 0:
			GDScriptUtils.encode_tag(buffer, 2, 5)
			GDScriptUtils.encode_varint(buffer, self.id)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.type = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.id = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["type"] = self.type
		dict["id"] = self.id
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("type"):
			self.type = dict.get("type")
		if dict.has("id"):
			self.id = dict.get("id")

# =========================================

class ReqAppearanceFlush_13233 extends Message:
	#1 : type
	var type: int = 0

	#2 : id
	var id: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.type = 0
		self.id = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = ReqAppearanceFlush_13233.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.ReqAppearanceFlush_13233"

	func MergeFrom(other : Message) -> void:
		if other is ReqAppearanceFlush_13233:
			self.type += other.type
			self.id += other.id
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.type != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
			GDScriptUtils.encode_varint(buffer, self.type)
		if self.id != 0:
			GDScriptUtils.encode_tag(buffer, 2, 5)
			GDScriptUtils.encode_varint(buffer, self.id)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.type = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.id = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["type"] = self.type
		dict["id"] = self.id
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("type"):
			self.type = dict.get("type")
		if dict.has("id"):
			self.id = dict.get("id")

# =========================================

class AppearanceInfo extends Message:
	#1 : type
	var type: int = 0

	#2 : item
	var _item: Array[AppearanceItem] = []
	var _item_size: int = 0
	## Size of _item
	func item_size() -> int:
		return self._item_size
	## Get _item
	func item() -> Array[AppearanceItem]:
		return self._item.slice(0, self._item_size)
	## Get _item item 
	func get_item(index: int) -> AppearanceItem: # index begin from 1
		if index > 0 and index <= _item_size and index <= _item.size():
			return self._item[index - 1]
		return null
	## Add _item
	func add_item(item: AppearanceItem) -> AppearanceItem:
		if self._item_size >= 0 and self._item_size < self._item.size():
			self._item[self._item_size] = item
		else:
			self._item.append(item)
		self._item_size += 1
		return item
	## Append _item
	func append_item(item_array: Array):
		for item in item_array:
			if item is AppearanceItem:
				self.add_item(item)
	## Clean _item 
	func clear_item() -> void:
		self._item_size = 0

	#3 : selectId
	var selectId: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.type = 0
		self.clear_item
		self.selectId = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = AppearanceInfo.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.AppearanceInfo"

	func MergeFrom(other : Message) -> void:
		if other is AppearanceInfo:
			self.type += other.type
			self._item = self._item.slice(0, _item_size)
			self._item.append_array(other._item.slice(0, other._item_size))
			self._item_size += other._item_size
			self.selectId += other.selectId
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.type != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
			GDScriptUtils.encode_varint(buffer, self.type)
		for item in self._item:
			GDScriptUtils.encode_tag(buffer, 2, 11)
			GDScriptUtils.encode_message(buffer, item)
		if self.selectId != 0:
			GDScriptUtils.encode_tag(buffer, 3, 5)
			GDScriptUtils.encode_varint(buffer, self.selectId)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.type = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var sub__item = AppearanceItem.new()
					var field_value = GDScriptUtils.decode_message(data, pos, sub__item)
					self.add_item(field_value[GDScriptUtils.VALUE_KEY])
					pos += field_value[GDScriptUtils.SIZE_KEY]
				3:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.selectId = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["type"] = self.type
		dict["item"] = []
		for index in range(1, self._item_size + 1):
			var item = self.get_item(index)
			dict["item"].append(item.SerializeToDictionary())
		dict["selectId"] = self.selectId
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("type"):
			self.type = dict.get("type")
		self.clear_item()
		if dict.has("item"):
			var list = dict["item"]
			for item in list:
				var item_msg = AppearanceItem.new()
				item_msg.ParseFromDictionary(item)
				self.add_item(item_msg)
		if dict.has("selectId"):
			self.selectId = dict.get("selectId")

# =========================================

class AppearanceItem extends Message:
	#1 : id
	var id: int = 0

	#2 : expiredTime
	var expiredTime: int = 0

	#3 : redPoint
	var redPoint: int = 0

	#4 : isCanWear
	var isCanWear: bool = true


	## Init message field values to default value
	func Init() -> void:
		self.id = 0
		self.expiredTime = 0
		self.redPoint = 0
		self.isCanWear = true

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = AppearanceItem.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.AppearanceItem"

	func MergeFrom(other : Message) -> void:
		if other is AppearanceItem:
			self.id += other.id
			self.expiredTime += other.expiredTime
			self.redPoint += other.redPoint
			self.isCanWear = other.isCanWear
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.id != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
			GDScriptUtils.encode_varint(buffer, self.id)
		if self.expiredTime != 0:
			GDScriptUtils.encode_tag(buffer, 2, 5)
			GDScriptUtils.encode_varint(buffer, self.expiredTime)
		if self.redPoint != 0:
			GDScriptUtils.encode_tag(buffer, 3, 5)
			GDScriptUtils.encode_varint(buffer, self.redPoint)
		if self.isCanWear != true:
			GDScriptUtils.encode_tag(buffer, 4, 8)
			GDScriptUtils.encode_bool(buffer, self.isCanWear)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.id = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.expiredTime = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				3:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.redPoint = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				4:
					var field_value = GDScriptUtils.decode_bool(data, pos, self)
					self.isCanWear = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["id"] = self.id
		dict["expiredTime"] = self.expiredTime
		dict["redPoint"] = self.redPoint
		dict["isCanWear"] = self.isCanWear
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("id"):
			self.id = dict.get("id")
		if dict.has("expiredTime"):
			self.expiredTime = dict.get("expiredTime")
		if dict.has("redPoint"):
			self.redPoint = dict.get("redPoint")
		if dict.has("isCanWear"):
			self.isCanWear = dict.get("isCanWear")

# =========================================

class RespAllUpgradeGuide_14596 extends Message:
	#1 : infos
	var _infos: Array[UpgradeGuide] = []
	var _infos_size: int = 0
	## Size of _infos
	func infos_size() -> int:
		return self._infos_size
	## Get _infos
	func infos() -> Array[UpgradeGuide]:
		return self._infos.slice(0, self._infos_size)
	## Get _infos item 
	func get_infos(index: int) -> UpgradeGuide: # index begin from 1
		if index > 0 and index <= _infos_size and index <= _infos.size():
			return self._infos[index - 1]
		return null
	## Add _infos
	func add_infos(item: UpgradeGuide) -> UpgradeGuide:
		if self._infos_size >= 0 and self._infos_size < self._infos.size():
			self._infos[self._infos_size] = item
		else:
			self._infos.append(item)
		self._infos_size += 1
		return item
	## Append _infos
	func append_infos(item_array: Array):
		for item in item_array:
			if item is UpgradeGuide:
				self.add_infos(item)
	## Clean _infos 
	func clear_infos() -> void:
		self._infos_size = 0

	#2 : isTip
	var isTip: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.clear_infos
		self.isTip = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = RespAllUpgradeGuide_14596.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.RespAllUpgradeGuide_14596"

	func MergeFrom(other : Message) -> void:
		if other is RespAllUpgradeGuide_14596:
			self._infos = self._infos.slice(0, _infos_size)
			self._infos.append_array(other._infos.slice(0, other._infos_size))
			self._infos_size += other._infos_size
			self.isTip += other.isTip
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		for item in self._infos:
			GDScriptUtils.encode_tag(buffer, 1, 11)
			GDScriptUtils.encode_message(buffer, item)
		if self.isTip != 0:
			GDScriptUtils.encode_tag(buffer, 2, 5)
			GDScriptUtils.encode_varint(buffer, self.isTip)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					var sub__infos = UpgradeGuide.new()
					var field_value = GDScriptUtils.decode_message(data, pos, sub__infos)
					self.add_infos(field_value[GDScriptUtils.VALUE_KEY])
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.isTip = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["infos"] = []
		for index in range(1, self._infos_size + 1):
			var item = self.get_infos(index)
			dict["infos"].append(item.SerializeToDictionary())
		dict["isTip"] = self.isTip
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		self.clear_infos()
		if dict.has("infos"):
			var list = dict["infos"]
			for item in list:
				var item_msg = UpgradeGuide.new()
				item_msg.ParseFromDictionary(item)
				self.add_infos(item_msg)
		if dict.has("isTip"):
			self.isTip = dict.get("isTip")

# =========================================

class ReqChangeUpgradeGuide_14595 extends Message:
	#1 : isTip
	var isTip: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.isTip = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = ReqChangeUpgradeGuide_14595.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.ReqChangeUpgradeGuide_14595"

	func MergeFrom(other : Message) -> void:
		if other is ReqChangeUpgradeGuide_14595:
			self.isTip += other.isTip
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.isTip != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
			GDScriptUtils.encode_varint(buffer, self.isTip)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.isTip = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["isTip"] = self.isTip
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("isTip"):
			self.isTip = dict.get("isTip")

# =========================================

class UpgradeGuide extends Message:
	#1 : id
	var id: int = 0

	#2 : status
	var status: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.id = 0
		self.status = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = UpgradeGuide.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.UpgradeGuide"

	func MergeFrom(other : Message) -> void:
		if other is UpgradeGuide:
			self.id += other.id
			self.status += other.status
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.id != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
			GDScriptUtils.encode_varint(buffer, self.id)
		if self.status != 0:
			GDScriptUtils.encode_tag(buffer, 2, 5)
			GDScriptUtils.encode_varint(buffer, self.status)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.id = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.status = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["id"] = self.id
		dict["status"] = self.status
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("id"):
			self.id = dict.get("id")
		if dict.has("status"):
			self.status = dict.get("status")

# =========================================

class GoodsNum extends Message:
	#1 : goodsId
	var goodsId: int = 0

	#2 : num
	var num: int = 0

	#3 : haveNum
	var haveNum: int = -1

	#4 : configGeneralId
	var configGeneralId: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.goodsId = 0
		self.num = 0
		self.haveNum = -1
		self.configGeneralId = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = GoodsNum.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.GoodsNum"

	func MergeFrom(other : Message) -> void:
		if other is GoodsNum:
			self.goodsId += other.goodsId
			self.num += other.num
			self.haveNum += other.haveNum
			self.configGeneralId += other.configGeneralId
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.goodsId != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
			GDScriptUtils.encode_varint(buffer, self.goodsId)
		if self.num != 0:
			GDScriptUtils.encode_tag(buffer, 2, 5)
			GDScriptUtils.encode_varint(buffer, self.num)
		if self.haveNum != -1:
			GDScriptUtils.encode_tag(buffer, 3, 5)
			GDScriptUtils.encode_varint(buffer, self.haveNum)
		if self.configGeneralId != 0:
			GDScriptUtils.encode_tag(buffer, 4, 5)
			GDScriptUtils.encode_varint(buffer, self.configGeneralId)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.goodsId = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.num = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				3:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.haveNum = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				4:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.configGeneralId = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["goodsId"] = self.goodsId
		dict["num"] = self.num
		dict["haveNum"] = self.haveNum
		dict["configGeneralId"] = self.configGeneralId
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("goodsId"):
			self.goodsId = dict.get("goodsId")
		if dict.has("num"):
			self.num = dict.get("num")
		if dict.has("haveNum"):
			self.haveNum = dict.get("haveNum")
		if dict.has("configGeneralId"):
			self.configGeneralId = dict.get("configGeneralId")

# =========================================

class GeneralReward extends Message:
	#1 : isChip
	var isChip: bool = false

	#2 : generalId
	var generalId: int = 0

	#3 : num
	var num: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.isChip = false
		self.generalId = 0
		self.num = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = GeneralReward.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.GeneralReward"

	func MergeFrom(other : Message) -> void:
		if other is GeneralReward:
			self.isChip = other.isChip
			self.generalId += other.generalId
			self.num += other.num
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.isChip != false:
			GDScriptUtils.encode_tag(buffer, 1, 8)
			GDScriptUtils.encode_bool(buffer, self.isChip)
		if self.generalId != 0:
			GDScriptUtils.encode_tag(buffer, 2, 5)
			GDScriptUtils.encode_varint(buffer, self.generalId)
		if self.num != 0:
			GDScriptUtils.encode_tag(buffer, 3, 5)
			GDScriptUtils.encode_varint(buffer, self.num)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					var field_value = GDScriptUtils.decode_bool(data, pos, self)
					self.isChip = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.generalId = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				3:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.num = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["isChip"] = self.isChip
		dict["generalId"] = self.generalId
		dict["num"] = self.num
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("isChip"):
			self.isChip = dict.get("isChip")
		if dict.has("generalId"):
			self.generalId = dict.get("generalId")
		if dict.has("num"):
			self.num = dict.get("num")

# =========================================

class MiniGameRank extends Message:
	#1 : rank
	var rank: int = 0

	#2 : name
	var name: String = ""

	#3 : grade
	var grade: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.rank = 0
		self.name = ""
		self.grade = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = MiniGameRank.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.MiniGameRank"

	func MergeFrom(other : Message) -> void:
		if other is MiniGameRank:
			self.rank += other.rank
			self.name += other.name
			self.grade += other.grade
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.rank != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
			GDScriptUtils.encode_varint(buffer, self.rank)
		if self.name != "":
			GDScriptUtils.encode_tag(buffer, 2, 9)
			GDScriptUtils.encode_string(buffer, self.name)
		if self.grade != 0:
			GDScriptUtils.encode_tag(buffer, 3, 5)
			GDScriptUtils.encode_varint(buffer, self.grade)
		return buffer
 
	func ParseFromBytes(data: PackedByteArray) -> int:
		var size = data.size()
		var pos = 0
 
		while pos < size:
			var tag = GDScriptUtils.decode_tag(data, pos)
			var field_number = tag[GDScriptUtils.VALUE_KEY]
			pos += tag[GDScriptUtils.SIZE_KEY]
 
			match field_number:
				1:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.rank = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_string(data, pos, self)
					self.name = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				3:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.grade = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["rank"] = self.rank
		dict["name"] = self.name
		dict["grade"] = self.grade
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("rank"):
			self.rank = dict.get("rank")
		if dict.has("name"):
			self.name = dict.get("name")
		if dict.has("grade"):
			self.grade = dict.get("grade")

# =========================================

