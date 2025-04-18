# Package: proto

const GDScriptUtils = preload("res://addons/protobuf/proto/GDScriptUtils.gd")
const Message = preload("res://addons/protobuf/proto/Message.gd")

enum CreateResult {
	FAILED = 0,
	SUCC = 1,
	FAILD_EXIST_NAME = 2,
	FAILD_UNVALID_NAME_FORMAT = 3,
	INVALID_ROLETYPE = 4,
	INVALID_OVERFLOW = 5,
	INVALID_SERVER_NOT_HOLDED = 6,
} 
 
class ReqLoginAuth_10000 extends Message:
	enum ClientType {
		Web = 0,
		Test_Client = 1,
	} 
 
	#1 : account
	var account: String = ""

	#2 : pf
	var pf: String = ""

	#3 : params
	var params: String = ""

	#4 : serverId
	var serverId: int = 0

	#5 : type
	var type: ReqLoginAuth_10000.ClientType = ReqLoginAuth_10000.ClientType.Web


	## Init message field values to default value
	func Init() -> void:
		self.account = ""
		self.pf = ""
		self.params = ""
		self.serverId = 0
		self.type = ReqLoginAuth_10000.ClientType.Web

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = ReqLoginAuth_10000.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.ReqLoginAuth_10000"

	func MergeFrom(other : Message) -> void:
		if other is ReqLoginAuth_10000:
			self.account += other.account
			self.pf += other.pf
			self.params += other.params
			self.serverId += other.serverId
			self.type = other.type
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.account != "":
			GDScriptUtils.encode_tag(buffer, 1, 9)
			GDScriptUtils.encode_string(buffer, self.account)
		if self.pf != "":
			GDScriptUtils.encode_tag(buffer, 2, 9)
			GDScriptUtils.encode_string(buffer, self.pf)
		if self.params != "":
			GDScriptUtils.encode_tag(buffer, 3, 9)
			GDScriptUtils.encode_string(buffer, self.params)
		if self.serverId != 0:
			GDScriptUtils.encode_tag(buffer, 4, 5)
			GDScriptUtils.encode_varint(buffer, self.serverId)
		if self.type != ReqLoginAuth_10000.ClientType.Web:
			GDScriptUtils.encode_tag(buffer, 5, 14)
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
					var field_value = GDScriptUtils.decode_string(data, pos, self)
					self.account = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_string(data, pos, self)
					self.pf = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				3:
					var field_value = GDScriptUtils.decode_string(data, pos, self)
					self.params = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				4:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.serverId = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				5:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.type = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["account"] = self.account
		dict["pf"] = self.pf
		dict["params"] = self.params
		dict["serverId"] = self.serverId
		dict["type"] = self.type
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("account"):
			self.account = dict.get("account")
		if dict.has("pf"):
			self.pf = dict.get("pf")
		if dict.has("params"):
			self.params = dict.get("params")
		if dict.has("serverId"):
			self.serverId = dict.get("serverId")
		if dict.has("type"):
			self.type = dict.get("type")

# =========================================

class RespLogin_10001 extends Message:
	enum AuthResult {
		STATUS_SUCCEED = 0,
		STATUS_FAILURE = 1,
		STATUS_INVALID = 2,
		STATUS_FORBID = 3,
		STATUS_MAINTAIN = 4,
		FORCE_IDCARD = 5,
		FORCE_INDULGE_MAXTIME = 6,
		FORCE_INDULGE_NIGHT = 7,
		FORCE_NEW_SERVER_CREATE = 8,
	} 
 
	#1 : status
	var status: RespLogin_10001.AuthResult = RespLogin_10001.AuthResult.STATUS_SUCCEED

	#2 : sessionKey
	var sessionKey: String = ""

	#3 : role
	var role: RoleInfo = null

	#4 : guide
	var guide: int = 0

	#6 : configVersion
	var configVersion: String = ""


	## Init message field values to default value
	func Init() -> void:
		self.status = RespLogin_10001.AuthResult.STATUS_SUCCEED
		self.sessionKey = ""
		if self.role != null:			self.role.clear()
		self.guide = 0
		self.configVersion = ""

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = RespLogin_10001.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.RespLogin_10001"

	func MergeFrom(other : Message) -> void:
		if other is RespLogin_10001:
			self.status = other.status
			self.sessionKey += other.sessionKey
			if other.role != null:
				if self.role == null:
					self.role = RoleInfo.new()
				self.role.MergeFrom(other.role)
			else:
				self.role = null
			self.guide += other.guide
			self.configVersion += other.configVersion
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.status != RespLogin_10001.AuthResult.STATUS_SUCCEED:
			GDScriptUtils.encode_tag(buffer, 1, 14)
			GDScriptUtils.encode_varint(buffer, self.status)
		if self.sessionKey != "":
			GDScriptUtils.encode_tag(buffer, 2, 9)
			GDScriptUtils.encode_string(buffer, self.sessionKey)
		if self.role != null:
			GDScriptUtils.encode_tag(buffer, 3, 11)
			GDScriptUtils.encode_message(buffer, self.role)
		if self.guide != 0:
			GDScriptUtils.encode_tag(buffer, 4, 5)
			GDScriptUtils.encode_varint(buffer, self.guide)
		if self.configVersion != "":
			GDScriptUtils.encode_tag(buffer, 6, 9)
			GDScriptUtils.encode_string(buffer, self.configVersion)
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
					self.status = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_string(data, pos, self)
					self.sessionKey = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				3:
					if self.role == null:
						self.role = RoleInfo.new()
					self.role.Init()
					var field_value = GDScriptUtils.decode_message(data, pos, self.role)
					self.role = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				4:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.guide = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				6:
					var field_value = GDScriptUtils.decode_string(data, pos, self)
					self.configVersion = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["status"] = self.status
		dict["sessionKey"] = self.sessionKey
		if self.role != null:
			dict["role"] = self.role.SerializeToDictionary()
		dict["guide"] = self.guide
		dict["configVersion"] = self.configVersion
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("status"):
			self.status = dict.get("status")
		if dict.has("sessionKey"):
			self.sessionKey = dict.get("sessionKey")
		if dict.has("role"):
			if self.role == null:
				self.role = RoleInfo.new()
			self.role.Init()
			self.role.ParseFromDictionary(dict.get("role"))
		else:
			self.role = null
		if dict.has("guide"):
			self.guide = dict.get("guide")
		if dict.has("configVersion"):
			self.configVersion = dict.get("configVersion")

# =========================================

class RoleInfo extends Message:
	#1 : playerId
	var playerId: int = 0

	#2 : name
	var name: String = ""

	#3 : level
	var level: int = 0

	#4 : roleType
	var roleType: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.playerId = 0
		self.name = ""
		self.level = 0
		self.roleType = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = RoleInfo.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.RoleInfo"

	func MergeFrom(other : Message) -> void:
		if other is RoleInfo:
			self.playerId += other.playerId
			self.name += other.name
			self.level += other.level
			self.roleType += other.roleType
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.playerId != 0:
			GDScriptUtils.encode_tag(buffer, 1, 3)
			GDScriptUtils.encode_varint(buffer, self.playerId)
		if self.name != "":
			GDScriptUtils.encode_tag(buffer, 2, 9)
			GDScriptUtils.encode_string(buffer, self.name)
		if self.level != 0:
			GDScriptUtils.encode_tag(buffer, 3, 5)
			GDScriptUtils.encode_varint(buffer, self.level)
		if self.roleType != 0:
			GDScriptUtils.encode_tag(buffer, 4, 5)
			GDScriptUtils.encode_varint(buffer, self.roleType)
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
					self.playerId = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_string(data, pos, self)
					self.name = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				3:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.level = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				4:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.roleType = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["playerId"] = self.playerId
		dict["name"] = self.name
		dict["level"] = self.level
		dict["roleType"] = self.roleType
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("playerId"):
			self.playerId = dict.get("playerId")
		if dict.has("name"):
			self.name = dict.get("name")
		if dict.has("level"):
			self.level = dict.get("level")
		if dict.has("roleType"):
			self.roleType = dict.get("roleType")

# =========================================

class ReqLoginAsk_10002 extends Message:
	#1 : playerId
	var playerId: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.playerId = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = ReqLoginAsk_10002.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.ReqLoginAsk_10002"

	func MergeFrom(other : Message) -> void:
		if other is ReqLoginAsk_10002:
			self.playerId += other.playerId
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.playerId != 0:
			GDScriptUtils.encode_tag(buffer, 1, 3)
			GDScriptUtils.encode_varint(buffer, self.playerId)
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
					self.playerId = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["playerId"] = self.playerId
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("playerId"):
			self.playerId = dict.get("playerId")

# =========================================

class RespLoginAsk_10003 extends Message:
	enum AuthResult {
		FAILED = 0,
		SUCC = 1,
		UN_REGISTER = 2,
		UN_CHOSE = 3,
		MAINTAIN = 4,
	} 
 
	#1 : status
	var status: RespLoginAsk_10003.AuthResult = RespLoginAsk_10003.AuthResult.SUCC

	#2 : openDays
	var openDays: int = 0

	#3 : mainRole
	var mainRole: MainRole = null

	#4 : currentTime
	var currentTime: int = 0

	#5 : todayFirst
	var todayFirst: bool = false

	#6 : isOfficialCheckIdCard
	var isOfficialCheckIdCard: bool = false

	#7 : dubboName
	var dubboName: String = ""

	#8 : loginGift
	var loginGift: String = ""

	#9 : sameServerDubboNames
	var _sameServerDubboNames: Array[String] = []
	var _sameServerDubboNames_size: int = 0
	## Size of _sameServerDubboNames
	func sameServerDubboNames_size() -> int:
		return self._sameServerDubboNames_size
	## Get _sameServerDubboNames
	func sameServerDubboNames() -> Array[String]:
		return self._sameServerDubboNames.slice(0, self._sameServerDubboNames_size)
	## Get _sameServerDubboNames item 
	func get_sameServerDubboNames(index: int) -> String: # index begin from 1
		if index > 0 and index <= _sameServerDubboNames_size and index <= _sameServerDubboNames.size():
			return self._sameServerDubboNames[index - 1]
		return ""
	## Add _sameServerDubboNames
	func add_sameServerDubboNames(item: String) -> String:
		if self._sameServerDubboNames_size >= 0 and self._sameServerDubboNames_size < self._sameServerDubboNames.size():
			self._sameServerDubboNames[self._sameServerDubboNames_size] = item
		else:
			self._sameServerDubboNames.append(item)
		self._sameServerDubboNames_size += 1
		return item
	## Append _sameServerDubboNames
	func append_sameServerDubboNames(item_array: Array):
		for item in item_array:
			if item is String:
				self.add_sameServerDubboNames(item)
	## Clean _sameServerDubboNames 
	func clear_sameServerDubboNames() -> void:
		self._sameServerDubboNames_size = 0

	#10 : isRegionOpen
	var isRegionOpen: int = 0

	#11 : createTime
	var createTime: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.status = RespLoginAsk_10003.AuthResult.SUCC
		self.openDays = 0
		if self.mainRole != null:			self.mainRole.clear()
		self.currentTime = 0
		self.todayFirst = false
		self.isOfficialCheckIdCard = false
		self.dubboName = ""
		self.loginGift = ""
		self.clear_sameServerDubboNames
		self.isRegionOpen = 0
		self.createTime = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = RespLoginAsk_10003.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.RespLoginAsk_10003"

	func MergeFrom(other : Message) -> void:
		if other is RespLoginAsk_10003:
			self.status = other.status
			self.openDays += other.openDays
			if other.mainRole != null:
				if self.mainRole == null:
					self.mainRole = MainRole.new()
				self.mainRole.MergeFrom(other.mainRole)
			else:
				self.mainRole = null
			self.currentTime += other.currentTime
			self.todayFirst = other.todayFirst
			self.isOfficialCheckIdCard = other.isOfficialCheckIdCard
			self.dubboName += other.dubboName
			self.loginGift += other.loginGift
			self._sameServerDubboNames = self._sameServerDubboNames.slice(0, _sameServerDubboNames_size)
			self._sameServerDubboNames.append_array(other._sameServerDubboNames.slice(0, other._sameServerDubboNames_size))
			self._sameServerDubboNames_size += other._sameServerDubboNames_size
			self.isRegionOpen += other.isRegionOpen
			self.createTime += other.createTime
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.status != RespLoginAsk_10003.AuthResult.SUCC:
			GDScriptUtils.encode_tag(buffer, 1, 14)
			GDScriptUtils.encode_varint(buffer, self.status)
		if self.openDays != 0:
			GDScriptUtils.encode_tag(buffer, 2, 5)
			GDScriptUtils.encode_varint(buffer, self.openDays)
		if self.mainRole != null:
			GDScriptUtils.encode_tag(buffer, 3, 11)
			GDScriptUtils.encode_message(buffer, self.mainRole)
		if self.currentTime != 0:
			GDScriptUtils.encode_tag(buffer, 4, 3)
			GDScriptUtils.encode_varint(buffer, self.currentTime)
		if self.todayFirst != false:
			GDScriptUtils.encode_tag(buffer, 5, 8)
			GDScriptUtils.encode_bool(buffer, self.todayFirst)
		if self.isOfficialCheckIdCard != false:
			GDScriptUtils.encode_tag(buffer, 6, 8)
			GDScriptUtils.encode_bool(buffer, self.isOfficialCheckIdCard)
		if self.dubboName != "":
			GDScriptUtils.encode_tag(buffer, 7, 9)
			GDScriptUtils.encode_string(buffer, self.dubboName)
		if self.loginGift != "":
			GDScriptUtils.encode_tag(buffer, 8, 9)
			GDScriptUtils.encode_string(buffer, self.loginGift)
		for item in self._sameServerDubboNames:
			GDScriptUtils.encode_tag(buffer, 9, 9)
			GDScriptUtils.encode_string(buffer, item)
		if self.isRegionOpen != 0:
			GDScriptUtils.encode_tag(buffer, 10, 5)
			GDScriptUtils.encode_varint(buffer, self.isRegionOpen)
		if self.createTime != 0:
			GDScriptUtils.encode_tag(buffer, 11, 3)
			GDScriptUtils.encode_varint(buffer, self.createTime)
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
					self.status = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.openDays = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				3:
					if self.mainRole == null:
						self.mainRole = MainRole.new()
					self.mainRole.Init()
					var field_value = GDScriptUtils.decode_message(data, pos, self.mainRole)
					self.mainRole = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				4:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.currentTime = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				5:
					var field_value = GDScriptUtils.decode_bool(data, pos, self)
					self.todayFirst = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				6:
					var field_value = GDScriptUtils.decode_bool(data, pos, self)
					self.isOfficialCheckIdCard = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				7:
					var field_value = GDScriptUtils.decode_string(data, pos, self)
					self.dubboName = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				8:
					var field_value = GDScriptUtils.decode_string(data, pos, self)
					self.loginGift = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				9:
					var field_value = GDScriptUtils.decode_string(data, pos, self)
					self.add_sameServerDubboNames(field_value[GDScriptUtils.VALUE_KEY])
					pos += field_value[GDScriptUtils.SIZE_KEY]
				10:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.isRegionOpen = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				11:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.createTime = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["status"] = self.status
		dict["openDays"] = self.openDays
		if self.mainRole != null:
			dict["mainRole"] = self.mainRole.SerializeToDictionary()
		dict["currentTime"] = self.currentTime
		dict["todayFirst"] = self.todayFirst
		dict["isOfficialCheckIdCard"] = self.isOfficialCheckIdCard
		dict["dubboName"] = self.dubboName
		dict["loginGift"] = self.loginGift
		dict["sameServerDubboNames"] = self._sameServerDubboNames
		dict["isRegionOpen"] = self.isRegionOpen
		dict["createTime"] = self.createTime
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("status"):
			self.status = dict.get("status")
		if dict.has("openDays"):
			self.openDays = dict.get("openDays")
		if dict.has("mainRole"):
			if self.mainRole == null:
				self.mainRole = MainRole.new()
			self.mainRole.Init()
			self.mainRole.ParseFromDictionary(dict.get("mainRole"))
		else:
			self.mainRole = null
		if dict.has("currentTime"):
			self.currentTime = dict.get("currentTime")
		if dict.has("todayFirst"):
			self.todayFirst = dict.get("todayFirst")
		if dict.has("isOfficialCheckIdCard"):
			self.isOfficialCheckIdCard = dict.get("isOfficialCheckIdCard")
		if dict.has("dubboName"):
			self.dubboName = dict.get("dubboName")
		if dict.has("loginGift"):
			self.loginGift = dict.get("loginGift")
		self.clear_sameServerDubboNames()
		if dict.has("sameServerDubboNames"):
			var list = dict["sameServerDubboNames"]
			for item in list:
				self.add_sameServerDubboNames(item)
		if dict.has("isRegionOpen"):
			self.isRegionOpen = dict.get("isRegionOpen")
		if dict.has("createTime"):
			self.createTime = dict.get("createTime")

# =========================================

class MainRole extends Message:
	#1 : id
	var id: int = 0

	#2 : name
	var name: String = ""

	#3 : level
	var level: int = 0

	#4 : titleLevel
	var titleLevel: int = 0

	#5 : gold
	var gold: int = 0

	#6 : copper
	var copper: int = 0

	#7 : xiuwei
	var xiuwei: int = 0

	#8 : gas
	var gas: int = 0

	#9 : prestige
	var prestige: int = 0

	#10 : energy
	var energy: int = 0

	#11 : vipLevel
	var vipLevel: int = 0

	#12 : embattleId
	var embattleId: int = 0

	#13 : year
	var year: int = 0

	#14 : season
	var season: int = 0

	#15 : energyMax
	var energyMax: int = 0

	#16 : forcesId
	var forcesId: int = 0

	#17 : legionId
	var legionId: int = 0

	#18 : cityId
	var cityId: int = 0

	#19 : bwTokenType
	var bwTokenType: int = 0

	#20 : sex
	var sex: int = 0

	#21 : memo
	var memo: String = ""

	#22 : merits
	var merits: int = 0

	#23 : modelId
	var modelId: int = 0

	#24 : worldBoom
	var worldBoom: int = 0

	#25 : roldId
	var roldId: int = 0

	#26 : strongTeamMapId
	var strongTeamMapId: int = 0

	#27 : donate
	var donate: int = 0

	#28 : freeSet
	var freeSet: String = ""

	#29 : isCheckIdCard
	var isCheckIdCard: bool = false

	#30 : maxBeatPowerNpcId
	var maxBeatPowerNpcId: int = 0

	#31 : silverCoin
	var silverCoin: int = 0

	#32 : systemGrowthVipType
	var systemGrowthVipType: String = ""

	#33 : xinFaLevel
	var xinFaLevel: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.id = 0
		self.name = ""
		self.level = 0
		self.titleLevel = 0
		self.gold = 0
		self.copper = 0
		self.xiuwei = 0
		self.gas = 0
		self.prestige = 0
		self.energy = 0
		self.vipLevel = 0
		self.embattleId = 0
		self.year = 0
		self.season = 0
		self.energyMax = 0
		self.forcesId = 0
		self.legionId = 0
		self.cityId = 0
		self.bwTokenType = 0
		self.sex = 0
		self.memo = ""
		self.merits = 0
		self.modelId = 0
		self.worldBoom = 0
		self.roldId = 0
		self.strongTeamMapId = 0
		self.donate = 0
		self.freeSet = ""
		self.isCheckIdCard = false
		self.maxBeatPowerNpcId = 0
		self.silverCoin = 0
		self.systemGrowthVipType = ""
		self.xinFaLevel = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = MainRole.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.MainRole"

	func MergeFrom(other : Message) -> void:
		if other is MainRole:
			self.id += other.id
			self.name += other.name
			self.level += other.level
			self.titleLevel += other.titleLevel
			self.gold += other.gold
			self.copper += other.copper
			self.xiuwei += other.xiuwei
			self.gas += other.gas
			self.prestige += other.prestige
			self.energy += other.energy
			self.vipLevel += other.vipLevel
			self.embattleId += other.embattleId
			self.year += other.year
			self.season += other.season
			self.energyMax += other.energyMax
			self.forcesId += other.forcesId
			self.legionId += other.legionId
			self.cityId += other.cityId
			self.bwTokenType += other.bwTokenType
			self.sex += other.sex
			self.memo += other.memo
			self.merits += other.merits
			self.modelId += other.modelId
			self.worldBoom += other.worldBoom
			self.roldId += other.roldId
			self.strongTeamMapId += other.strongTeamMapId
			self.donate += other.donate
			self.freeSet += other.freeSet
			self.isCheckIdCard = other.isCheckIdCard
			self.maxBeatPowerNpcId += other.maxBeatPowerNpcId
			self.silverCoin += other.silverCoin
			self.systemGrowthVipType += other.systemGrowthVipType
			self.xinFaLevel += other.xinFaLevel
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.id != 0:
			GDScriptUtils.encode_tag(buffer, 1, 3)
			GDScriptUtils.encode_varint(buffer, self.id)
		if self.name != "":
			GDScriptUtils.encode_tag(buffer, 2, 9)
			GDScriptUtils.encode_string(buffer, self.name)
		if self.level != 0:
			GDScriptUtils.encode_tag(buffer, 3, 5)
			GDScriptUtils.encode_varint(buffer, self.level)
		if self.titleLevel != 0:
			GDScriptUtils.encode_tag(buffer, 4, 5)
			GDScriptUtils.encode_varint(buffer, self.titleLevel)
		if self.gold != 0:
			GDScriptUtils.encode_tag(buffer, 5, 3)
			GDScriptUtils.encode_varint(buffer, self.gold)
		if self.copper != 0:
			GDScriptUtils.encode_tag(buffer, 6, 3)
			GDScriptUtils.encode_varint(buffer, self.copper)
		if self.xiuwei != 0:
			GDScriptUtils.encode_tag(buffer, 7, 3)
			GDScriptUtils.encode_varint(buffer, self.xiuwei)
		if self.gas != 0:
			GDScriptUtils.encode_tag(buffer, 8, 3)
			GDScriptUtils.encode_varint(buffer, self.gas)
		if self.prestige != 0:
			GDScriptUtils.encode_tag(buffer, 9, 3)
			GDScriptUtils.encode_varint(buffer, self.prestige)
		if self.energy != 0:
			GDScriptUtils.encode_tag(buffer, 10, 3)
			GDScriptUtils.encode_varint(buffer, self.energy)
		if self.vipLevel != 0:
			GDScriptUtils.encode_tag(buffer, 11, 5)
			GDScriptUtils.encode_varint(buffer, self.vipLevel)
		if self.embattleId != 0:
			GDScriptUtils.encode_tag(buffer, 12, 5)
			GDScriptUtils.encode_varint(buffer, self.embattleId)
		if self.year != 0:
			GDScriptUtils.encode_tag(buffer, 13, 5)
			GDScriptUtils.encode_varint(buffer, self.year)
		if self.season != 0:
			GDScriptUtils.encode_tag(buffer, 14, 5)
			GDScriptUtils.encode_varint(buffer, self.season)
		if self.energyMax != 0:
			GDScriptUtils.encode_tag(buffer, 15, 5)
			GDScriptUtils.encode_varint(buffer, self.energyMax)
		if self.forcesId != 0:
			GDScriptUtils.encode_tag(buffer, 16, 5)
			GDScriptUtils.encode_varint(buffer, self.forcesId)
		if self.legionId != 0:
			GDScriptUtils.encode_tag(buffer, 17, 5)
			GDScriptUtils.encode_varint(buffer, self.legionId)
		if self.cityId != 0:
			GDScriptUtils.encode_tag(buffer, 18, 5)
			GDScriptUtils.encode_varint(buffer, self.cityId)
		if self.bwTokenType != 0:
			GDScriptUtils.encode_tag(buffer, 19, 5)
			GDScriptUtils.encode_varint(buffer, self.bwTokenType)
		if self.sex != 0:
			GDScriptUtils.encode_tag(buffer, 20, 5)
			GDScriptUtils.encode_varint(buffer, self.sex)
		if self.memo != "":
			GDScriptUtils.encode_tag(buffer, 21, 9)
			GDScriptUtils.encode_string(buffer, self.memo)
		if self.merits != 0:
			GDScriptUtils.encode_tag(buffer, 22, 3)
			GDScriptUtils.encode_varint(buffer, self.merits)
		if self.modelId != 0:
			GDScriptUtils.encode_tag(buffer, 23, 5)
			GDScriptUtils.encode_varint(buffer, self.modelId)
		if self.worldBoom != 0:
			GDScriptUtils.encode_tag(buffer, 24, 5)
			GDScriptUtils.encode_varint(buffer, self.worldBoom)
		if self.roldId != 0:
			GDScriptUtils.encode_tag(buffer, 25, 5)
			GDScriptUtils.encode_varint(buffer, self.roldId)
		if self.strongTeamMapId != 0:
			GDScriptUtils.encode_tag(buffer, 26, 5)
			GDScriptUtils.encode_varint(buffer, self.strongTeamMapId)
		if self.donate != 0:
			GDScriptUtils.encode_tag(buffer, 27, 3)
			GDScriptUtils.encode_varint(buffer, self.donate)
		if self.freeSet != "":
			GDScriptUtils.encode_tag(buffer, 28, 9)
			GDScriptUtils.encode_string(buffer, self.freeSet)
		if self.isCheckIdCard != false:
			GDScriptUtils.encode_tag(buffer, 29, 8)
			GDScriptUtils.encode_bool(buffer, self.isCheckIdCard)
		if self.maxBeatPowerNpcId != 0:
			GDScriptUtils.encode_tag(buffer, 30, 5)
			GDScriptUtils.encode_varint(buffer, self.maxBeatPowerNpcId)
		if self.silverCoin != 0:
			GDScriptUtils.encode_tag(buffer, 31, 3)
			GDScriptUtils.encode_varint(buffer, self.silverCoin)
		if self.systemGrowthVipType != "":
			GDScriptUtils.encode_tag(buffer, 32, 9)
			GDScriptUtils.encode_string(buffer, self.systemGrowthVipType)
		if self.xinFaLevel != 0:
			GDScriptUtils.encode_tag(buffer, 33, 5)
			GDScriptUtils.encode_varint(buffer, self.xinFaLevel)
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
					self.name = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				3:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.level = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				4:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.titleLevel = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				5:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.gold = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				6:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.copper = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				7:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.xiuwei = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				8:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.gas = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				9:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.prestige = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				10:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.energy = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				11:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.vipLevel = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				12:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.embattleId = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				13:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.year = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				14:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.season = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				15:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.energyMax = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				16:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.forcesId = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				17:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.legionId = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				18:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.cityId = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				19:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.bwTokenType = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				20:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.sex = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				21:
					var field_value = GDScriptUtils.decode_string(data, pos, self)
					self.memo = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				22:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.merits = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				23:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.modelId = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				24:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.worldBoom = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				25:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.roldId = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				26:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.strongTeamMapId = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				27:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.donate = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				28:
					var field_value = GDScriptUtils.decode_string(data, pos, self)
					self.freeSet = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				29:
					var field_value = GDScriptUtils.decode_bool(data, pos, self)
					self.isCheckIdCard = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				30:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.maxBeatPowerNpcId = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				31:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.silverCoin = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				32:
					var field_value = GDScriptUtils.decode_string(data, pos, self)
					self.systemGrowthVipType = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				33:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.xinFaLevel = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["id"] = self.id
		dict["name"] = self.name
		dict["level"] = self.level
		dict["titleLevel"] = self.titleLevel
		dict["gold"] = self.gold
		dict["copper"] = self.copper
		dict["xiuwei"] = self.xiuwei
		dict["gas"] = self.gas
		dict["prestige"] = self.prestige
		dict["energy"] = self.energy
		dict["vipLevel"] = self.vipLevel
		dict["embattleId"] = self.embattleId
		dict["year"] = self.year
		dict["season"] = self.season
		dict["energyMax"] = self.energyMax
		dict["forcesId"] = self.forcesId
		dict["legionId"] = self.legionId
		dict["cityId"] = self.cityId
		dict["bwTokenType"] = self.bwTokenType
		dict["sex"] = self.sex
		dict["memo"] = self.memo
		dict["merits"] = self.merits
		dict["modelId"] = self.modelId
		dict["worldBoom"] = self.worldBoom
		dict["roldId"] = self.roldId
		dict["strongTeamMapId"] = self.strongTeamMapId
		dict["donate"] = self.donate
		dict["freeSet"] = self.freeSet
		dict["isCheckIdCard"] = self.isCheckIdCard
		dict["maxBeatPowerNpcId"] = self.maxBeatPowerNpcId
		dict["silverCoin"] = self.silverCoin
		dict["systemGrowthVipType"] = self.systemGrowthVipType
		dict["xinFaLevel"] = self.xinFaLevel
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("id"):
			self.id = dict.get("id")
		if dict.has("name"):
			self.name = dict.get("name")
		if dict.has("level"):
			self.level = dict.get("level")
		if dict.has("titleLevel"):
			self.titleLevel = dict.get("titleLevel")
		if dict.has("gold"):
			self.gold = dict.get("gold")
		if dict.has("copper"):
			self.copper = dict.get("copper")
		if dict.has("xiuwei"):
			self.xiuwei = dict.get("xiuwei")
		if dict.has("gas"):
			self.gas = dict.get("gas")
		if dict.has("prestige"):
			self.prestige = dict.get("prestige")
		if dict.has("energy"):
			self.energy = dict.get("energy")
		if dict.has("vipLevel"):
			self.vipLevel = dict.get("vipLevel")
		if dict.has("embattleId"):
			self.embattleId = dict.get("embattleId")
		if dict.has("year"):
			self.year = dict.get("year")
		if dict.has("season"):
			self.season = dict.get("season")
		if dict.has("energyMax"):
			self.energyMax = dict.get("energyMax")
		if dict.has("forcesId"):
			self.forcesId = dict.get("forcesId")
		if dict.has("legionId"):
			self.legionId = dict.get("legionId")
		if dict.has("cityId"):
			self.cityId = dict.get("cityId")
		if dict.has("bwTokenType"):
			self.bwTokenType = dict.get("bwTokenType")
		if dict.has("sex"):
			self.sex = dict.get("sex")
		if dict.has("memo"):
			self.memo = dict.get("memo")
		if dict.has("merits"):
			self.merits = dict.get("merits")
		if dict.has("modelId"):
			self.modelId = dict.get("modelId")
		if dict.has("worldBoom"):
			self.worldBoom = dict.get("worldBoom")
		if dict.has("roldId"):
			self.roldId = dict.get("roldId")
		if dict.has("strongTeamMapId"):
			self.strongTeamMapId = dict.get("strongTeamMapId")
		if dict.has("donate"):
			self.donate = dict.get("donate")
		if dict.has("freeSet"):
			self.freeSet = dict.get("freeSet")
		if dict.has("isCheckIdCard"):
			self.isCheckIdCard = dict.get("isCheckIdCard")
		if dict.has("maxBeatPowerNpcId"):
			self.maxBeatPowerNpcId = dict.get("maxBeatPowerNpcId")
		if dict.has("silverCoin"):
			self.silverCoin = dict.get("silverCoin")
		if dict.has("systemGrowthVipType"):
			self.systemGrowthVipType = dict.get("systemGrowthVipType")
		if dict.has("xinFaLevel"):
			self.xinFaLevel = dict.get("xinFaLevel")

# =========================================

class ReqCreate_10004 extends Message:
	#1 : nickName
	var nickName: String = ""

	#2 : sex
	var sex: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.nickName = ""
		self.sex = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = ReqCreate_10004.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.ReqCreate_10004"

	func MergeFrom(other : Message) -> void:
		if other is ReqCreate_10004:
			self.nickName += other.nickName
			self.sex += other.sex
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.nickName != "":
			GDScriptUtils.encode_tag(buffer, 1, 9)
			GDScriptUtils.encode_string(buffer, self.nickName)
		if self.sex != 0:
			GDScriptUtils.encode_tag(buffer, 2, 5)
			GDScriptUtils.encode_varint(buffer, self.sex)
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
					self.nickName = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.sex = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["nickName"] = self.nickName
		dict["sex"] = self.sex
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("nickName"):
			self.nickName = dict.get("nickName")
		if dict.has("sex"):
			self.sex = dict.get("sex")

# =========================================

class RespCreate_10005 extends Message:
	#1 : result
	var result: CreateResult = 0

	#2 : playerId
	var playerId: int = 0

	#3 : name
	var name: String = ""

	#4 : serverTime
	var serverTime: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.result = 0
		self.playerId = 0
		self.name = ""
		self.serverTime = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = RespCreate_10005.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.RespCreate_10005"

	func MergeFrom(other : Message) -> void:
		if other is RespCreate_10005:
			self.result = other.result
			self.playerId += other.playerId
			self.name += other.name
			self.serverTime += other.serverTime
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.result != 0:
			GDScriptUtils.encode_tag(buffer, 1, 14)
			GDScriptUtils.encode_varint(buffer, self.result)
		if self.playerId != 0:
			GDScriptUtils.encode_tag(buffer, 2, 3)
			GDScriptUtils.encode_varint(buffer, self.playerId)
		if self.name != "":
			GDScriptUtils.encode_tag(buffer, 3, 9)
			GDScriptUtils.encode_string(buffer, self.name)
		if self.serverTime != 0:
			GDScriptUtils.encode_tag(buffer, 4, 3)
			GDScriptUtils.encode_varint(buffer, self.serverTime)
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
					self.result = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.playerId = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				3:
					var field_value = GDScriptUtils.decode_string(data, pos, self)
					self.name = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				4:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.serverTime = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["result"] = self.result
		dict["playerId"] = self.playerId
		dict["name"] = self.name
		dict["serverTime"] = self.serverTime
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("result"):
			self.result = dict.get("result")
		if dict.has("playerId"):
			self.playerId = dict.get("playerId")
		if dict.has("name"):
			self.name = dict.get("name")
		if dict.has("serverTime"):
			self.serverTime = dict.get("serverTime")

# =========================================

class ReqChoseRole_10020 extends Message:
	#1 : roleType
	var roleType: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.roleType = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = ReqChoseRole_10020.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.ReqChoseRole_10020"

	func MergeFrom(other : Message) -> void:
		if other is ReqChoseRole_10020:
			self.roleType += other.roleType
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.roleType != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
			GDScriptUtils.encode_varint(buffer, self.roleType)
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
					self.roleType = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["roleType"] = self.roleType
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("roleType"):
			self.roleType = dict.get("roleType")

# =========================================

class RespChoseRole_10021 extends Message:
	#1 : result
	var result: CreateResult = 0


	## Init message field values to default value
	func Init() -> void:
		self.result = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = RespChoseRole_10021.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.RespChoseRole_10021"

	func MergeFrom(other : Message) -> void:
		if other is RespChoseRole_10021:
			self.result = other.result
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.result != 0:
			GDScriptUtils.encode_tag(buffer, 1, 14)
			GDScriptUtils.encode_varint(buffer, self.result)
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
					self.result = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["result"] = self.result
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("result"):
			self.result = dict.get("result")

# =========================================

class RespHeartBeat_10051 extends Message:
	#1 : timeInSec
	var timeInSec: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.timeInSec = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = RespHeartBeat_10051.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.RespHeartBeat_10051"

	func MergeFrom(other : Message) -> void:
		if other is RespHeartBeat_10051:
			self.timeInSec += other.timeInSec
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.timeInSec != 0:
			GDScriptUtils.encode_tag(buffer, 1, 3)
			GDScriptUtils.encode_varint(buffer, self.timeInSec)
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
					self.timeInSec = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["timeInSec"] = self.timeInSec
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("timeInSec"):
			self.timeInSec = dict.get("timeInSec")

# =========================================

class RespKickAccount_10052 extends Message:
	#1 : type
	var type: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.type = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = RespKickAccount_10052.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.RespKickAccount_10052"

	func MergeFrom(other : Message) -> void:
		if other is RespKickAccount_10052:
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

class RespChangeSeason_10008 extends Message:
	#1 : year
	var year: int = 0

	#2 : season
	var season: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.year = 0
		self.season = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = RespChangeSeason_10008.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.RespChangeSeason_10008"

	func MergeFrom(other : Message) -> void:
		if other is RespChangeSeason_10008:
			self.year += other.year
			self.season += other.season
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.year != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
			GDScriptUtils.encode_varint(buffer, self.year)
		if self.season != 0:
			GDScriptUtils.encode_tag(buffer, 2, 5)
			GDScriptUtils.encode_varint(buffer, self.season)
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
					self.year = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.season = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["year"] = self.year
		dict["season"] = self.season
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("year"):
			self.year = dict.get("year")
		if dict.has("season"):
			self.season = dict.get("season")

# =========================================

class ReqGuideRecordStep_10011 extends Message:
	#1 : step
	var step: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.step = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = ReqGuideRecordStep_10011.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.ReqGuideRecordStep_10011"

	func MergeFrom(other : Message) -> void:
		if other is ReqGuideRecordStep_10011:
			self.step += other.step
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.step != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
			GDScriptUtils.encode_varint(buffer, self.step)
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
					self.step = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["step"] = self.step
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("step"):
			self.step = dict.get("step")

# =========================================

class RespGuideRecordStep_10012 extends Message:
	#1 : step
	var step: int = 0

	#2 : curTask
	var curTask: GuideTask = null

	#3 : isSkip
	var isSkip: bool = false

	#4 : dismissTip
	var dismissTip: bool = false

	#5 : autoRoleMark
	var autoRoleMark: int = 0

	#6 : softGuide
	var softGuide: String = ""

	#7 : isTalentGuide
	var isTalentGuide: bool = false

	#8 : trgDiaRecord
	var trgDiaRecord: String = ""


	## Init message field values to default value
	func Init() -> void:
		self.step = 0
		if self.curTask != null:			self.curTask.clear()
		self.isSkip = false
		self.dismissTip = false
		self.autoRoleMark = 0
		self.softGuide = ""
		self.isTalentGuide = false
		self.trgDiaRecord = ""

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = RespGuideRecordStep_10012.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.RespGuideRecordStep_10012"

	func MergeFrom(other : Message) -> void:
		if other is RespGuideRecordStep_10012:
			self.step += other.step
			if other.curTask != null:
				if self.curTask == null:
					self.curTask = GuideTask.new()
				self.curTask.MergeFrom(other.curTask)
			else:
				self.curTask = null
			self.isSkip = other.isSkip
			self.dismissTip = other.dismissTip
			self.autoRoleMark += other.autoRoleMark
			self.softGuide += other.softGuide
			self.isTalentGuide = other.isTalentGuide
			self.trgDiaRecord += other.trgDiaRecord
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.step != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
			GDScriptUtils.encode_varint(buffer, self.step)
		if self.curTask != null:
			GDScriptUtils.encode_tag(buffer, 2, 11)
			GDScriptUtils.encode_message(buffer, self.curTask)
		if self.isSkip != false:
			GDScriptUtils.encode_tag(buffer, 3, 8)
			GDScriptUtils.encode_bool(buffer, self.isSkip)
		if self.dismissTip != false:
			GDScriptUtils.encode_tag(buffer, 4, 8)
			GDScriptUtils.encode_bool(buffer, self.dismissTip)
		if self.autoRoleMark != 0:
			GDScriptUtils.encode_tag(buffer, 5, 5)
			GDScriptUtils.encode_varint(buffer, self.autoRoleMark)
		if self.softGuide != "":
			GDScriptUtils.encode_tag(buffer, 6, 9)
			GDScriptUtils.encode_string(buffer, self.softGuide)
		if self.isTalentGuide != false:
			GDScriptUtils.encode_tag(buffer, 7, 8)
			GDScriptUtils.encode_bool(buffer, self.isTalentGuide)
		if self.trgDiaRecord != "":
			GDScriptUtils.encode_tag(buffer, 8, 9)
			GDScriptUtils.encode_string(buffer, self.trgDiaRecord)
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
					self.step = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					if self.curTask == null:
						self.curTask = GuideTask.new()
					self.curTask.Init()
					var field_value = GDScriptUtils.decode_message(data, pos, self.curTask)
					self.curTask = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				3:
					var field_value = GDScriptUtils.decode_bool(data, pos, self)
					self.isSkip = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				4:
					var field_value = GDScriptUtils.decode_bool(data, pos, self)
					self.dismissTip = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				5:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.autoRoleMark = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				6:
					var field_value = GDScriptUtils.decode_string(data, pos, self)
					self.softGuide = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				7:
					var field_value = GDScriptUtils.decode_bool(data, pos, self)
					self.isTalentGuide = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				8:
					var field_value = GDScriptUtils.decode_string(data, pos, self)
					self.trgDiaRecord = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["step"] = self.step
		if self.curTask != null:
			dict["curTask"] = self.curTask.SerializeToDictionary()
		dict["isSkip"] = self.isSkip
		dict["dismissTip"] = self.dismissTip
		dict["autoRoleMark"] = self.autoRoleMark
		dict["softGuide"] = self.softGuide
		dict["isTalentGuide"] = self.isTalentGuide
		dict["trgDiaRecord"] = self.trgDiaRecord
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("step"):
			self.step = dict.get("step")
		if dict.has("curTask"):
			if self.curTask == null:
				self.curTask = GuideTask.new()
			self.curTask.Init()
			self.curTask.ParseFromDictionary(dict.get("curTask"))
		else:
			self.curTask = null
		if dict.has("isSkip"):
			self.isSkip = dict.get("isSkip")
		if dict.has("dismissTip"):
			self.dismissTip = dict.get("dismissTip")
		if dict.has("autoRoleMark"):
			self.autoRoleMark = dict.get("autoRoleMark")
		if dict.has("softGuide"):
			self.softGuide = dict.get("softGuide")
		if dict.has("isTalentGuide"):
			self.isTalentGuide = dict.get("isTalentGuide")
		if dict.has("trgDiaRecord"):
			self.trgDiaRecord = dict.get("trgDiaRecord")

# =========================================

class ReqGuideFrontSaveData_10038 extends Message:
	#1 : isTalentGuide
	var isTalentGuide: bool = false


	## Init message field values to default value
	func Init() -> void:
		self.isTalentGuide = false

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = ReqGuideFrontSaveData_10038.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.ReqGuideFrontSaveData_10038"

	func MergeFrom(other : Message) -> void:
		if other is ReqGuideFrontSaveData_10038:
			self.isTalentGuide = other.isTalentGuide
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.isTalentGuide != false:
			GDScriptUtils.encode_tag(buffer, 1, 8)
			GDScriptUtils.encode_bool(buffer, self.isTalentGuide)
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
					self.isTalentGuide = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["isTalentGuide"] = self.isTalentGuide
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("isTalentGuide"):
			self.isTalentGuide = dict.get("isTalentGuide")

# =========================================

class ReqRecordDialogue_10039 extends Message:
	#1 : id
	var id: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.id = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = ReqRecordDialogue_10039.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.ReqRecordDialogue_10039"

	func MergeFrom(other : Message) -> void:
		if other is ReqRecordDialogue_10039:
			self.id += other.id
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.id != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
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
					self.id = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["id"] = self.id
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("id"):
			self.id = dict.get("id")

# =========================================

class GuideTask extends Message:
	#1 : taskId
	var taskId: int = 0

	#2 : status
	var status: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.taskId = 0
		self.status = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = GuideTask.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.GuideTask"

	func MergeFrom(other : Message) -> void:
		if other is GuideTask:
			self.taskId += other.taskId
			self.status += other.status
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.taskId != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
			GDScriptUtils.encode_varint(buffer, self.taskId)
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
					self.taskId = field_value[GDScriptUtils.VALUE_KEY]
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
		dict["taskId"] = self.taskId
		dict["status"] = self.status
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("taskId"):
			self.taskId = dict.get("taskId")
		if dict.has("status"):
			self.status = dict.get("status")

# =========================================

class ReqSkipGuide_10015 extends Message:
	#1 : skip
	var skip: bool = false


	## Init message field values to default value
	func Init() -> void:
		self.skip = false

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = ReqSkipGuide_10015.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.ReqSkipGuide_10015"

	func MergeFrom(other : Message) -> void:
		if other is ReqSkipGuide_10015:
			self.skip = other.skip
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.skip != false:
			GDScriptUtils.encode_tag(buffer, 1, 8)
			GDScriptUtils.encode_bool(buffer, self.skip)
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
					self.skip = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["skip"] = self.skip
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("skip"):
			self.skip = dict.get("skip")

# =========================================

class ReqFinishGuideTask_10017 extends Message:
	#1 : taskId
	var taskId: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.taskId = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = ReqFinishGuideTask_10017.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.ReqFinishGuideTask_10017"

	func MergeFrom(other : Message) -> void:
		if other is ReqFinishGuideTask_10017:
			self.taskId += other.taskId
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.taskId != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
			GDScriptUtils.encode_varint(buffer, self.taskId)
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
					self.taskId = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["taskId"] = self.taskId
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("taskId"):
			self.taskId = dict.get("taskId")

# =========================================

class ReqUpdateNameSexAfterAutoRole_10023 extends Message:
	#1 : nickName
	var nickName: String = ""

	#2 : sex
	var sex: int = 0

	#3 : isConfirm
	var isConfirm: bool = false


	## Init message field values to default value
	func Init() -> void:
		self.nickName = ""
		self.sex = 0
		self.isConfirm = false

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = ReqUpdateNameSexAfterAutoRole_10023.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.ReqUpdateNameSexAfterAutoRole_10023"

	func MergeFrom(other : Message) -> void:
		if other is ReqUpdateNameSexAfterAutoRole_10023:
			self.nickName += other.nickName
			self.sex += other.sex
			self.isConfirm = other.isConfirm
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.nickName != "":
			GDScriptUtils.encode_tag(buffer, 1, 9)
			GDScriptUtils.encode_string(buffer, self.nickName)
		if self.sex != 0:
			GDScriptUtils.encode_tag(buffer, 2, 5)
			GDScriptUtils.encode_varint(buffer, self.sex)
		if self.isConfirm != false:
			GDScriptUtils.encode_tag(buffer, 3, 8)
			GDScriptUtils.encode_bool(buffer, self.isConfirm)
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
					self.nickName = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.sex = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				3:
					var field_value = GDScriptUtils.decode_bool(data, pos, self)
					self.isConfirm = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["nickName"] = self.nickName
		dict["sex"] = self.sex
		dict["isConfirm"] = self.isConfirm
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("nickName"):
			self.nickName = dict.get("nickName")
		if dict.has("sex"):
			self.sex = dict.get("sex")
		if dict.has("isConfirm"):
			self.isConfirm = dict.get("isConfirm")

# =========================================

class ReqInnerLogin_10025 extends Message:
	#1 : uid
	var uid: int = 0

	#2 : timestamp
	var timestamp: int = 0

	#3 : sign
	var sign: String = ""

	#4 : pf
	var pf: String = ""

	#5 : serverId
	var serverId: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.uid = 0
		self.timestamp = 0
		self.sign = ""
		self.pf = ""
		self.serverId = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = ReqInnerLogin_10025.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.ReqInnerLogin_10025"

	func MergeFrom(other : Message) -> void:
		if other is ReqInnerLogin_10025:
			self.uid += other.uid
			self.timestamp += other.timestamp
			self.sign += other.sign
			self.pf += other.pf
			self.serverId += other.serverId
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.uid != 0:
			GDScriptUtils.encode_tag(buffer, 1, 3)
			GDScriptUtils.encode_varint(buffer, self.uid)
		if self.timestamp != 0:
			GDScriptUtils.encode_tag(buffer, 2, 3)
			GDScriptUtils.encode_varint(buffer, self.timestamp)
		if self.sign != "":
			GDScriptUtils.encode_tag(buffer, 3, 9)
			GDScriptUtils.encode_string(buffer, self.sign)
		if self.pf != "":
			GDScriptUtils.encode_tag(buffer, 4, 9)
			GDScriptUtils.encode_string(buffer, self.pf)
		if self.serverId != 0:
			GDScriptUtils.encode_tag(buffer, 5, 5)
			GDScriptUtils.encode_varint(buffer, self.serverId)
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
					self.uid = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.timestamp = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				3:
					var field_value = GDScriptUtils.decode_string(data, pos, self)
					self.sign = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				4:
					var field_value = GDScriptUtils.decode_string(data, pos, self)
					self.pf = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				5:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.serverId = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["uid"] = self.uid
		dict["timestamp"] = self.timestamp
		dict["sign"] = self.sign
		dict["pf"] = self.pf
		dict["serverId"] = self.serverId
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("uid"):
			self.uid = dict.get("uid")
		if dict.has("timestamp"):
			self.timestamp = dict.get("timestamp")
		if dict.has("sign"):
			self.sign = dict.get("sign")
		if dict.has("pf"):
			self.pf = dict.get("pf")
		if dict.has("serverId"):
			self.serverId = dict.get("serverId")

# =========================================

class ReqCkeckIdentity_10018 extends Message:
	#1 : idcard
	var idcard: String = ""

	#2 : name
	var name: String = ""

	#3 : from
	var from: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.idcard = ""
		self.name = ""
		self.from = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = ReqCkeckIdentity_10018.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.ReqCkeckIdentity_10018"

	func MergeFrom(other : Message) -> void:
		if other is ReqCkeckIdentity_10018:
			self.idcard += other.idcard
			self.name += other.name
			self.from += other.from
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.idcard != "":
			GDScriptUtils.encode_tag(buffer, 1, 9)
			GDScriptUtils.encode_string(buffer, self.idcard)
		if self.name != "":
			GDScriptUtils.encode_tag(buffer, 2, 9)
			GDScriptUtils.encode_string(buffer, self.name)
		if self.from != 0:
			GDScriptUtils.encode_tag(buffer, 3, 5)
			GDScriptUtils.encode_varint(buffer, self.from)
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
					self.idcard = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_string(data, pos, self)
					self.name = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				3:
					var field_value = GDScriptUtils.decode_varint(data, pos, self)
					self.from = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["idcard"] = self.idcard
		dict["name"] = self.name
		dict["from"] = self.from
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("idcard"):
			self.idcard = dict.get("idcard")
		if dict.has("name"):
			self.name = dict.get("name")
		if dict.has("from"):
			self.from = dict.get("from")

# =========================================

class RespReqCkeckIdentity_10019 extends Message:
	#1 : result
	var result: bool = false

	#2 : message
	var message: String = ""


	## Init message field values to default value
	func Init() -> void:
		self.result = false
		self.message = ""

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = RespReqCkeckIdentity_10019.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.RespReqCkeckIdentity_10019"

	func MergeFrom(other : Message) -> void:
		if other is RespReqCkeckIdentity_10019:
			self.result = other.result
			self.message += other.message
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.result != false:
			GDScriptUtils.encode_tag(buffer, 1, 8)
			GDScriptUtils.encode_bool(buffer, self.result)
		if self.message != "":
			GDScriptUtils.encode_tag(buffer, 2, 9)
			GDScriptUtils.encode_string(buffer, self.message)
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
					self.result = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				2:
					var field_value = GDScriptUtils.decode_string(data, pos, self)
					self.message = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["result"] = self.result
		dict["message"] = self.message
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("result"):
			self.result = dict.get("result")
		if dict.has("message"):
			self.message = dict.get("message")

# =========================================

class ReqRewardLoginFeedBack_10024 extends Message:
	#1 : message
	var message: String = ""


	## Init message field values to default value
	func Init() -> void:
		self.message = ""

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = ReqRewardLoginFeedBack_10024.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.ReqRewardLoginFeedBack_10024"

	func MergeFrom(other : Message) -> void:
		if other is ReqRewardLoginFeedBack_10024:
			self.message += other.message
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.message != "":
			GDScriptUtils.encode_tag(buffer, 1, 9)
			GDScriptUtils.encode_string(buffer, self.message)
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
					self.message = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["message"] = self.message
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("message"):
			self.message = dict.get("message")

# =========================================

class ReqRecordSoftGuide_10026 extends Message:
	#1 : key
	var key: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.key = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = ReqRecordSoftGuide_10026.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.ReqRecordSoftGuide_10026"

	func MergeFrom(other : Message) -> void:
		if other is ReqRecordSoftGuide_10026:
			self.key += other.key
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.key != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
			GDScriptUtils.encode_varint(buffer, self.key)
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
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["key"] = self.key
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("key"):
			self.key = dict.get("key")

# =========================================

class ReqFinishGuide_10027 extends Message:
	#1 : id
	var id: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.id = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = ReqFinishGuide_10027.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.ReqFinishGuide_10027"

	func MergeFrom(other : Message) -> void:
		if other is ReqFinishGuide_10027:
			self.id += other.id
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.id != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
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
					self.id = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["id"] = self.id
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("id"):
			self.id = dict.get("id")

# =========================================

class ReqGainGuideReward_10028 extends Message:
	#1 : id
	var id: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.id = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = ReqGainGuideReward_10028.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.ReqGainGuideReward_10028"

	func MergeFrom(other : Message) -> void:
		if other is ReqGainGuideReward_10028:
			self.id += other.id
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.id != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
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
					self.id = field_value[GDScriptUtils.VALUE_KEY]
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["id"] = self.id
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("id"):
			self.id = dict.get("id")

# =========================================

class RespGuideInfo_10029 extends Message:
	#1 : guideInfo
	var _guideInfo: Array[GuideTask] = []
	var _guideInfo_size: int = 0
	## Size of _guideInfo
	func guideInfo_size() -> int:
		return self._guideInfo_size
	## Get _guideInfo
	func guideInfo() -> Array[GuideTask]:
		return self._guideInfo.slice(0, self._guideInfo_size)
	## Get _guideInfo item 
	func get_guideInfo(index: int) -> GuideTask: # index begin from 1
		if index > 0 and index <= _guideInfo_size and index <= _guideInfo.size():
			return self._guideInfo[index - 1]
		return null
	## Add _guideInfo
	func add_guideInfo(item: GuideTask) -> GuideTask:
		if self._guideInfo_size >= 0 and self._guideInfo_size < self._guideInfo.size():
			self._guideInfo[self._guideInfo_size] = item
		else:
			self._guideInfo.append(item)
		self._guideInfo_size += 1
		return item
	## Append _guideInfo
	func append_guideInfo(item_array: Array):
		for item in item_array:
			if item is GuideTask:
				self.add_guideInfo(item)
	## Clean _guideInfo 
	func clear_guideInfo() -> void:
		self._guideInfo_size = 0


	## Init message field values to default value
	func Init() -> void:
		self.clear_guideInfo

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = RespGuideInfo_10029.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.RespGuideInfo_10029"

	func MergeFrom(other : Message) -> void:
		if other is RespGuideInfo_10029:
			self._guideInfo = self._guideInfo.slice(0, _guideInfo_size)
			self._guideInfo.append_array(other._guideInfo.slice(0, other._guideInfo_size))
			self._guideInfo_size += other._guideInfo_size
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		for item in self._guideInfo:
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
					var sub__guideInfo = GuideTask.new()
					var field_value = GDScriptUtils.decode_message(data, pos, sub__guideInfo)
					self.add_guideInfo(field_value[GDScriptUtils.VALUE_KEY])
					pos += field_value[GDScriptUtils.SIZE_KEY]
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["guideInfo"] = []
		for index in range(1, self._guideInfo_size + 1):
			var item = self.get_guideInfo(index)
			dict["guideInfo"].append(item.SerializeToDictionary())
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		self.clear_guideInfo()
		if dict.has("guideInfo"):
			var list = dict["guideInfo"]
			for item in list:
				var item_msg = GuideTask.new()
				item_msg.ParseFromDictionary(item)
				self.add_guideInfo(item_msg)

# =========================================

class ReqGuideFight_10037 extends Message:
	#1 : key
	var key: int = 0


	## Init message field values to default value
	func Init() -> void:
		self.key = 0

	## Create a new message instance
	## Returns: Message - New message instance
	func New() -> Message:
		var msg = ReqGuideFight_10037.new()
		return msg

	## Message ProtoName
	## Returns: String - ProtoName
	func ProtoName() -> String:
		return "proto.ReqGuideFight_10037"

	func MergeFrom(other : Message) -> void:
		if other is ReqGuideFight_10037:
			self.key += other.key
 
	func SerializeToBytes(buffer: PackedByteArray = PackedByteArray()) -> PackedByteArray:
		if self.key != 0:
			GDScriptUtils.encode_tag(buffer, 1, 5)
			GDScriptUtils.encode_varint(buffer, self.key)
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
				_:
					pass

		return pos

	func SerializeToDictionary() -> Dictionary:
		var dict = {}
		dict["key"] = self.key
		return dict

	func ParseFromDictionary(dict: Dictionary) -> void:
		if dict == null:
			return

		if dict.has("key"):
			self.key = dict.get("key")

# =========================================
