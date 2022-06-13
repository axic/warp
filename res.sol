Optimized IR:
/// @use-src 0:"tests/behaviour/solidity/test/libsolidity/semanticTests/various/negative_stack_height.sol"
object "C_139" {
    code {
        /// @src 0:0:1530  "contract C {..."
        mstore(64, memoryguard(128))
        if callvalue()
        {
            revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb()
        }
        constructor_C_139()
        let _1 := allocate_unbounded()
        codecopy(_1, dataoffset("C_139_deployed"), datasize("C_139_deployed"))
        return(_1, datasize("C_139_deployed"))
        function allocate_unbounded() -> memPtr
        { memPtr := mload(64) }
        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb()
        { revert(0, 0) }
        function constructor_C_139()
        { }
    }
    /// @use-src 0:"tests/behaviour/solidity/test/libsolidity/semanticTests/various/negative_stack_height.sol"
    object "C_139_deployed" {
        code {
            /// @src 0:0:1530  "contract C {..."
            mstore(64, memoryguard(128))
            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector
                case 0x10e1cdcb {
                    external_fun_return500PaymentsByDates_138()
                }
                case 0x4e6d1405 { external_fun_invoices_5() }
                case 0x7903f54a {
                    external_fun_return500InvoicesByDates_92()
                }
                case 0x7f2a39c0 { external_fun_nredit_40() }
                default { }
            }
            revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74()
            function shift_right_224_unsigned(value) -> newValue
            { newValue := shr(224, value) }
            function allocate_unbounded() -> memPtr
            { memPtr := mload(64) }
            function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb()
            { revert(0, 0) }
            function revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b()
            { revert(0, 0) }
            function revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db()
            { revert(0, 0) }
            function cleanup_t_uint256(value) -> cleaned
            { cleaned := value }
            function validator_revert_t_uint256(value)
            {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }
            function abi_decode_t_uint256(offset, end) -> value
            {
                value := calldataload(offset)
                validator_revert_t_uint256(value)
            }
            function abi_decode_tuple_t_uint256t_uint256t_uint256(headStart, dataEnd) -> value0, value1, value2
            {
                if slt(sub(dataEnd, headStart), 96)
                {
                    revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b()
                }
                {
                    let offset := 0
                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }
                {
                    let offset := 32
                    value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }
                {
                    let offset := 64
                    value2 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }
            }
            function array_length_t_array$_t_uint256_$500_memory_ptr(value) -> length
            { length := 0x01f4 }
            function array_storeLengthForEncoding_t_array$_t_uint256_$500_memory_ptr_fromStack(pos, length) -> updated_pos
            { updated_pos := pos }
            function array_dataslot_t_array$_t_uint256_$500_memory_ptr(ptr) -> data
            { data := ptr }
            function abi_encode_t_uint256_to_t_uint256(value, pos)
            {
                mstore(pos, cleanup_t_uint256(value))
            }
            function abi_encodeUpdatedPos_t_uint256_to_t_uint256(value0, pos) -> updatedPos
            {
                abi_encode_t_uint256_to_t_uint256(value0, pos)
                updatedPos := add(pos, 0x20)
            }
            function array_nextElement_t_array$_t_uint256_$500_memory_ptr(ptr) -> next
            { next := add(ptr, 0x20) }
            function abi_encode_t_array$_t_uint256_$500_memory_ptr_to_t_array$_t_uint256_$500_memory_ptr_fromStack(value, pos)
            {
                let length := array_length_t_array$_t_uint256_$500_memory_ptr(value)
                pos := array_storeLengthForEncoding_t_array$_t_uint256_$500_memory_ptr_fromStack(pos, length)
                let baseRef := array_dataslot_t_array$_t_uint256_$500_memory_ptr(value)
                let srcPtr := baseRef
                for { let i := 0 } lt(i, length) { i := add(i, 1) }
                {
                    let elementValue0 := mload(srcPtr)
                    pos := abi_encodeUpdatedPos_t_uint256_to_t_uint256(elementValue0, pos)
                    srcPtr := array_nextElement_t_array$_t_uint256_$500_memory_ptr(srcPtr)
                }
            }
            function array_length_t_array$_t_bool_$500_memory_ptr(value) -> length
            { length := 0x01f4 }
            function array_storeLengthForEncoding_t_array$_t_bool_$500_memory_ptr_fromStack(pos, length) -> updated_pos
            { updated_pos := pos }
            function array_dataslot_t_array$_t_bool_$500_memory_ptr(ptr) -> data
            { data := ptr }
            function cleanup_t_bool(value) -> cleaned
            {
                cleaned := iszero(iszero(value))
            }
            function abi_encode_t_bool_to_t_bool(value, pos)
            {
                mstore(pos, cleanup_t_bool(value))
            }
            function abi_encodeUpdatedPos_t_bool_to_t_bool(value0, pos) -> updatedPos
            {
                abi_encode_t_bool_to_t_bool(value0, pos)
                updatedPos := add(pos, 0x20)
            }
            function array_nextElement_t_array$_t_bool_$500_memory_ptr(ptr) -> next
            { next := add(ptr, 0x20) }
            function abi_encode_t_array$_t_bool_$500_memory_ptr_to_t_array$_t_bool_$500_memory_ptr_fromStack(value, pos)
            {
                let length := array_length_t_array$_t_bool_$500_memory_ptr(value)
                pos := array_storeLengthForEncoding_t_array$_t_bool_$500_memory_ptr_fromStack(pos, length)
                let baseRef := array_dataslot_t_array$_t_bool_$500_memory_ptr(value)
                let srcPtr := baseRef
                for { let i := 0 } lt(i, length) { i := add(i, 1) }
                {
                    let elementValue0 := mload(srcPtr)
                    pos := abi_encodeUpdatedPos_t_bool_to_t_bool(elementValue0, pos)
                    srcPtr := array_nextElement_t_array$_t_bool_$500_memory_ptr(srcPtr)
                }
            }
            function array_length_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr(value) -> length
            { length := 0x01f4 }
            function array_storeLengthForEncoding_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr_fromStack(pos, length) -> updated_pos
            { updated_pos := pos }
            function array_dataslot_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr(ptr) -> data
            { data := ptr }
            function array_length_t_array$_t_bytes32_$3_memory_ptr(value) -> length
            { length := 0x03 }
            function array_storeLengthForEncoding_t_array$_t_bytes32_$3_memory_ptr(pos, length) -> updated_pos
            { updated_pos := pos }
            function array_dataslot_t_array$_t_bytes32_$3_memory_ptr(ptr) -> data
            { data := ptr }
            function cleanup_t_bytes32(value) -> cleaned
            { cleaned := value }
            function abi_encode_t_bytes32_to_t_bytes32(value, pos)
            {
                mstore(pos, cleanup_t_bytes32(value))
            }
            function abi_encodeUpdatedPos_t_bytes32_to_t_bytes32(value0, pos) -> updatedPos
            {
                abi_encode_t_bytes32_to_t_bytes32(value0, pos)
                updatedPos := add(pos, 0x20)
            }
            function array_nextElement_t_array$_t_bytes32_$3_memory_ptr(ptr) -> next
            { next := add(ptr, 0x20) }
            function abi_encode_t_array$_t_bytes32_$3_memory_ptr_to_t_array$_t_bytes32_$3_memory_ptr(value, pos)
            {
                let length := array_length_t_array$_t_bytes32_$3_memory_ptr(value)
                pos := array_storeLengthForEncoding_t_array$_t_bytes32_$3_memory_ptr(pos, length)
                let baseRef := array_dataslot_t_array$_t_bytes32_$3_memory_ptr(value)
                let srcPtr := baseRef
                for { let i := 0 } lt(i, length) { i := add(i, 1) }
                {
                    let elementValue0 := mload(srcPtr)
                    pos := abi_encodeUpdatedPos_t_bytes32_to_t_bytes32(elementValue0, pos)
                    srcPtr := array_nextElement_t_array$_t_bytes32_$3_memory_ptr(srcPtr)
                }
            }
            function abi_encodeUpdatedPos_t_array$_t_bytes32_$3_memory_ptr_to_t_array$_t_bytes32_$3_memory_ptr(value0, pos) -> updatedPos
            {
                abi_encode_t_array$_t_bytes32_$3_memory_ptr_to_t_array$_t_bytes32_$3_memory_ptr(value0, pos)
                updatedPos := add(pos, 0x60)
            }
            function array_nextElement_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr(ptr) -> next
            { next := add(ptr, 0x20) }
            function abi_encode_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr_to_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr_fromStack(value, pos)
            {
                let length := array_length_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr(value)
                pos := array_storeLengthForEncoding_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr_fromStack(pos, length)
                let baseRef := array_dataslot_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr(value)
                let srcPtr := baseRef
                for { let i := 0 } lt(i, length) { i := add(i, 1) }
                {
                    let elementValue0 := mload(srcPtr)
                    pos := abi_encodeUpdatedPos_t_array$_t_bytes32_$3_memory_ptr_to_t_array$_t_bytes32_$3_memory_ptr(elementValue0, pos)
                    srcPtr := array_nextElement_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr(srcPtr)
                }
            }
            function array_length_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr(value) -> length
            { length := 0x01f4 }
            function array_storeLengthForEncoding_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr_fromStack(pos, length) -> updated_pos
            { updated_pos := pos }
            function array_dataslot_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr(ptr) -> data
            { data := ptr }
            function array_length_t_array$_t_bytes32_$2_memory_ptr(value) -> length
            { length := 0x02 }
            function array_storeLengthForEncoding_t_array$_t_bytes32_$2_memory_ptr(pos, length) -> updated_pos
            { updated_pos := pos }
            function array_dataslot_t_array$_t_bytes32_$2_memory_ptr(ptr) -> data
            { data := ptr }
            function array_nextElement_t_array$_t_bytes32_$2_memory_ptr(ptr) -> next
            { next := add(ptr, 0x20) }
            function abi_encode_t_array$_t_bytes32_$2_memory_ptr_to_t_array$_t_bytes32_$2_memory_ptr(value, pos)
            {
                let length := array_length_t_array$_t_bytes32_$2_memory_ptr(value)
                pos := array_storeLengthForEncoding_t_array$_t_bytes32_$2_memory_ptr(pos, length)
                let baseRef := array_dataslot_t_array$_t_bytes32_$2_memory_ptr(value)
                let srcPtr := baseRef
                for { let i := 0 } lt(i, length) { i := add(i, 1) }
                {
                    let elementValue0 := mload(srcPtr)
                    pos := abi_encodeUpdatedPos_t_bytes32_to_t_bytes32(elementValue0, pos)
                    srcPtr := array_nextElement_t_array$_t_bytes32_$2_memory_ptr(srcPtr)
                }
            }
            function abi_encodeUpdatedPos_t_array$_t_bytes32_$2_memory_ptr_to_t_array$_t_bytes32_$2_memory_ptr(value0, pos) -> updatedPos
            {
                abi_encode_t_array$_t_bytes32_$2_memory_ptr_to_t_array$_t_bytes32_$2_memory_ptr(value0, pos)
                updatedPos := add(pos, 0x40)
            }
            function array_nextElement_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr(ptr) -> next
            { next := add(ptr, 0x20) }
            function abi_encode_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr_to_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr_fromStack(value, pos)
            {
                let length := array_length_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr(value)
                pos := array_storeLengthForEncoding_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr_fromStack(pos, length)
                let baseRef := array_dataslot_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr(value)
                let srcPtr := baseRef
                for { let i := 0 } lt(i, length) { i := add(i, 1) }
                {
                    let elementValue0 := mload(srcPtr)
                    pos := abi_encodeUpdatedPos_t_array$_t_bytes32_$2_memory_ptr_to_t_array$_t_bytes32_$2_memory_ptr(elementValue0, pos)
                    srcPtr := array_nextElement_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr(srcPtr)
                }
            }
            function abi_encode_tuple_t_array$_t_uint256_$500_memory_ptr_t_array$_t_uint256_$500_memory_ptr_t_array$_t_uint256_$500_memory_ptr_t_array$_t_bool_$500_memory_ptr_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr_t_array$_t_uint256_$500_memory_ptr_t_array$_t_bool_$500_memory_ptr__to_t_array$_t_uint256_$500_memory_ptr_t_array$_t_uint256_$500_memory_ptr_t_array$_t_uint256_$500_memory_ptr_t_array$_t_bool_$500_memory_ptr_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr_t_array$_t_uint256_$500_memory_ptr_t_array$_t_bool_$500_memory_ptr__fromStack(headStart, value0, value1, value2, value3, value4, value5, value6, value7) -> tail
            {
                tail := add(headStart, 176000)
                abi_encode_t_array$_t_uint256_$500_memory_ptr_to_t_array$_t_uint256_$500_memory_ptr_fromStack(value0, add(headStart, 0))
                abi_encode_t_array$_t_uint256_$500_memory_ptr_to_t_array$_t_uint256_$500_memory_ptr_fromStack(value1, add(headStart, 16000))
                abi_encode_t_array$_t_uint256_$500_memory_ptr_to_t_array$_t_uint256_$500_memory_ptr_fromStack(value2, add(headStart, 32000))
                abi_encode_t_array$_t_bool_$500_memory_ptr_to_t_array$_t_bool_$500_memory_ptr_fromStack(value3, add(headStart, 48000))
                abi_encode_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr_to_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr_fromStack(value4, add(headStart, 64000))
                abi_encode_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr_to_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr_fromStack(value5, add(headStart, 112000))
                abi_encode_t_array$_t_uint256_$500_memory_ptr_to_t_array$_t_uint256_$500_memory_ptr_fromStack(value6, add(headStart, 144000))
                abi_encode_t_array$_t_bool_$500_memory_ptr_to_t_array$_t_bool_$500_memory_ptr_fromStack(value7, add(headStart, 160000))
            }
            function external_fun_return500PaymentsByDates_138()
            {
                if callvalue()
                {
                    revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb()
                }
                let param_0, param_1, param_2 := abi_decode_tuple_t_uint256t_uint256t_uint256(4, calldatasize())
                let ret_0, ret_1, ret_2, ret_3, ret_4, ret_5, ret_6, ret_7 := fun_return500PaymentsByDates_138(param_0, param_1, param_2)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_array$_t_uint256_$500_memory_ptr_t_array$_t_uint256_$500_memory_ptr_t_array$_t_uint256_$500_memory_ptr_t_array$_t_bool_$500_memory_ptr_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr_t_array$_t_uint256_$500_memory_ptr_t_array$_t_bool_$500_memory_ptr__to_t_array$_t_uint256_$500_memory_ptr_t_array$_t_uint256_$500_memory_ptr_t_array$_t_uint256_$500_memory_ptr_t_array$_t_bool_$500_memory_ptr_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr_t_array$_t_uint256_$500_memory_ptr_t_array$_t_bool_$500_memory_ptr__fromStack(memPos, ret_0, ret_1, ret_2, ret_3, ret_4, ret_5, ret_6, ret_7)
                return(memPos, sub(memEnd, memPos))
            }
            function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0
            {
                if slt(sub(dataEnd, headStart), 32)
                {
                    revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b()
                }
                {
                    let offset := 0
                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }
            }
            function identity(value) -> ret
            { ret := value }
            function convert_t_uint256_to_t_uint256(value) -> converted
            {
                converted := cleanup_t_uint256(identity(cleanup_t_uint256(value)))
            }
            function mapping_index_access_t_mapping$_t_uint256_$_t_struct$_Invoice_$14_storage_$_of_t_uint256(slot, key) -> dataSlot
            {
                mstore(0, convert_t_uint256_to_t_uint256(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }
            function shift_right_0_unsigned(value) -> newValue
            { newValue := shr(0, value) }
            function cleanup_from_storage_t_uint256(value) -> cleaned
            { cleaned := value }
            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value
            {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }
            function read_from_storage_split_offset_0_t_uint256(slot) -> value
            {
                value := extract_from_storage_value_offset_0t_uint256(sload(slot))
            }
            function cleanup_from_storage_t_bool(value) -> cleaned
            { cleaned := and(value, 0xff) }
            function extract_from_storage_value_offset_0t_bool(slot_value) -> value
            {
                value := cleanup_from_storage_t_bool(shift_right_0_unsigned(slot_value))
            }
            function read_from_storage_split_offset_0_t_bool(slot) -> value
            {
                value := extract_from_storage_value_offset_0t_bool(sload(slot))
            }
            function shift_right_8_unsigned(value) -> newValue
            { newValue := shr(8, value) }
            function extract_from_storage_value_offset_1t_bool(slot_value) -> value
            {
                value := cleanup_from_storage_t_bool(shift_right_8_unsigned(slot_value))
            }
            function read_from_storage_split_offset_1_t_bool(slot) -> value
            {
                value := extract_from_storage_value_offset_1t_bool(sload(slot))
            }
            function shift_right_16_unsigned(value) -> newValue
            { newValue := shr(16, value) }
            function extract_from_storage_value_offset_2t_bool(slot_value) -> value
            {
                value := cleanup_from_storage_t_bool(shift_right_16_unsigned(slot_value))
            }
            function read_from_storage_split_offset_2_t_bool(slot) -> value
            {
                value := extract_from_storage_value_offset_2t_bool(sload(slot))
            }
            /// @ast-id 5 @src 0:17:60  "mapping(uint256 => Invoice) public invoices"
            function getter_fun_invoices_5(key_0) -> ret_0, ret_1, ret_2, ret_3
            {
                let slot := 0
                let offset := 0
                slot := mapping_index_access_t_mapping$_t_uint256_$_t_struct$_Invoice_$14_storage_$_of_t_uint256(slot, key_0)
                ret_0 := read_from_storage_split_offset_0_t_uint256(add(slot, 0))
                ret_1 := read_from_storage_split_offset_0_t_bool(add(slot, 1))
                ret_2 := read_from_storage_split_offset_1_t_bool(add(slot, 1))
                ret_3 := read_from_storage_split_offset_2_t_bool(add(slot, 1))
            }
            /// @src 0:0:1530  "contract C {..."
            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos)
            {
                mstore(pos, cleanup_t_uint256(value))
            }
            function abi_encode_t_bool_to_t_bool_fromStack(value, pos)
            {
                mstore(pos, cleanup_t_bool(value))
            }
            function abi_encode_tuple_t_uint256_t_bool_t_bool_t_bool__to_t_uint256_t_bool_t_bool_t_bool__fromStack(headStart, value0, value1, value2, value3) -> tail
            {
                tail := add(headStart, 128)
                abi_encode_t_uint256_to_t_uint256_fromStack(value0, add(headStart, 0))
                abi_encode_t_bool_to_t_bool_fromStack(value1, add(headStart, 32))
                abi_encode_t_bool_to_t_bool_fromStack(value2, add(headStart, 64))
                abi_encode_t_bool_to_t_bool_fromStack(value3, add(headStart, 96))
            }
            function external_fun_invoices_5()
            {
                if callvalue()
                {
                    revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb()
                }
                let param_0 := abi_decode_tuple_t_uint256(4, calldatasize())
                let ret_0, ret_1, ret_2, ret_3 := getter_fun_invoices_5(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint256_t_bool_t_bool_t_bool__to_t_uint256_t_bool_t_bool_t_bool__fromStack(memPos, ret_0, ret_1, ret_2, ret_3)
                return(memPos, sub(memEnd, memPos))
            }
            function abi_encode_tuple_t_array$_t_uint256_$500_memory_ptr_t_array$_t_bool_$500_memory_ptr_t_array$_t_uint256_$500_memory_ptr_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr_t_array$_t_uint256_$500_memory_ptr_t_array$_t_bool_$500_memory_ptr_t_array$_t_bool_$500_memory_ptr__to_t_array$_t_uint256_$500_memory_ptr_t_array$_t_bool_$500_memory_ptr_t_array$_t_uint256_$500_memory_ptr_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr_t_array$_t_uint256_$500_memory_ptr_t_array$_t_bool_$500_memory_ptr_t_array$_t_bool_$500_memory_ptr__fromStack(headStart, value0, value1, value2, value3, value4, value5, value6, value7, value8) -> tail
            {
                tail := add(headStart, 224000)
                abi_encode_t_array$_t_uint256_$500_memory_ptr_to_t_array$_t_uint256_$500_memory_ptr_fromStack(value0, add(headStart, 0))
                abi_encode_t_array$_t_bool_$500_memory_ptr_to_t_array$_t_bool_$500_memory_ptr_fromStack(value1, add(headStart, 16000))
                abi_encode_t_array$_t_uint256_$500_memory_ptr_to_t_array$_t_uint256_$500_memory_ptr_fromStack(value2, add(headStart, 32000))
                abi_encode_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr_to_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr_fromStack(value3, add(headStart, 48000))
                abi_encode_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr_to_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr_fromStack(value4, add(headStart, 96000))
                abi_encode_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr_to_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr_fromStack(value5, add(headStart, 144000))
                abi_encode_t_array$_t_uint256_$500_memory_ptr_to_t_array$_t_uint256_$500_memory_ptr_fromStack(value6, add(headStart, 176000))
                abi_encode_t_array$_t_bool_$500_memory_ptr_to_t_array$_t_bool_$500_memory_ptr_fromStack(value7, add(headStart, 192000))
                abi_encode_t_array$_t_bool_$500_memory_ptr_to_t_array$_t_bool_$500_memory_ptr_fromStack(value8, add(headStart, 208000))
            }
            function external_fun_return500InvoicesByDates_92()
            {
                if callvalue()
                {
                    revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb()
                }
                let param_0, param_1, param_2 := abi_decode_tuple_t_uint256t_uint256t_uint256(4, calldatasize())
                let ret_0, ret_1, ret_2, ret_3, ret_4, ret_5, ret_6, ret_7, ret_8 := fun_return500InvoicesByDates_92(param_0, param_1, param_2)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_array$_t_uint256_$500_memory_ptr_t_array$_t_bool_$500_memory_ptr_t_array$_t_uint256_$500_memory_ptr_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr_t_array$_t_uint256_$500_memory_ptr_t_array$_t_bool_$500_memory_ptr_t_array$_t_bool_$500_memory_ptr__to_t_array$_t_uint256_$500_memory_ptr_t_array$_t_bool_$500_memory_ptr_t_array$_t_uint256_$500_memory_ptr_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr_t_array$_t_uint256_$500_memory_ptr_t_array$_t_bool_$500_memory_ptr_t_array$_t_bool_$500_memory_ptr__fromStack(memPos, ret_0, ret_1, ret_2, ret_3, ret_4, ret_5, ret_6, ret_7, ret_8)
                return(memPos, sub(memEnd, memPos))
            }
            function abi_encode_tuple_t_array$_t_uint256_$500_memory_ptr_t_array$_t_uint256_$500_memory_ptr_t_array$_t_uint256_$500_memory_ptr_t_array$_t_bool_$500_memory_ptr_t_array$_t_uint256_$500_memory_ptr__to_t_array$_t_uint256_$500_memory_ptr_t_array$_t_uint256_$500_memory_ptr_t_array$_t_uint256_$500_memory_ptr_t_array$_t_bool_$500_memory_ptr_t_array$_t_uint256_$500_memory_ptr__fromStack(headStart, value0, value1, value2, value3, value4) -> tail
            {
                tail := add(headStart, 80000)
                abi_encode_t_array$_t_uint256_$500_memory_ptr_to_t_array$_t_uint256_$500_memory_ptr_fromStack(value0, add(headStart, 0))
                abi_encode_t_array$_t_uint256_$500_memory_ptr_to_t_array$_t_uint256_$500_memory_ptr_fromStack(value1, add(headStart, 16000))
                abi_encode_t_array$_t_uint256_$500_memory_ptr_to_t_array$_t_uint256_$500_memory_ptr_fromStack(value2, add(headStart, 32000))
                abi_encode_t_array$_t_bool_$500_memory_ptr_to_t_array$_t_bool_$500_memory_ptr_fromStack(value3, add(headStart, 48000))
                abi_encode_t_array$_t_uint256_$500_memory_ptr_to_t_array$_t_uint256_$500_memory_ptr_fromStack(value4, add(headStart, 64000))
            }
            function external_fun_nredit_40()
            {
                if callvalue()
                {
                    revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb()
                }
                let param_0 := abi_decode_tuple_t_uint256(4, calldatasize())
                let ret_0, ret_1, ret_2, ret_3, ret_4 := fun_nredit_40(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_array$_t_uint256_$500_memory_ptr_t_array$_t_uint256_$500_memory_ptr_t_array$_t_uint256_$500_memory_ptr_t_array$_t_bool_$500_memory_ptr_t_array$_t_uint256_$500_memory_ptr__to_t_array$_t_uint256_$500_memory_ptr_t_array$_t_uint256_$500_memory_ptr_t_array$_t_uint256_$500_memory_ptr_t_array$_t_bool_$500_memory_ptr_t_array$_t_uint256_$500_memory_ptr__fromStack(memPos, ret_0, ret_1, ret_2, ret_3, ret_4)
                return(memPos, sub(memEnd, memPos))
            }
            function revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74()
            { revert(0, 0) }
            function round_up_to_mul_of_32(value) -> result
            {
                result := and(add(value, 31), not(31))
            }
            function panic_error_0x41()
            {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x41)
                revert(0, 0x24)
            }
            function finalize_allocation(memPtr, size)
            {
                let newFreePtr := add(memPtr, round_up_to_mul_of_32(size))
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error_0x41() }
                mstore(64, newFreePtr)
            }
            function allocate_memory(size) -> memPtr
            {
                memPtr := allocate_unbounded()
                finalize_allocation(memPtr, size)
            }
            function array_allocation_size_t_array$_t_uint256_$500_memory_ptr(length) -> size
            {
                if gt(length, 0xffffffffffffffff) { panic_error_0x41() }
                size := mul(length, 0x20)
            }
            function allocate_memory_array_t_array$_t_uint256_$500_memory_ptr(length) -> memPtr
            {
                let allocSize := array_allocation_size_t_array$_t_uint256_$500_memory_ptr(length)
                memPtr := allocate_memory(allocSize)
            }
            function zero_memory_chunk_t_uint256(dataStart, dataSizeInBytes)
            {
                calldatacopy(dataStart, calldatasize(), dataSizeInBytes)
            }
            function allocate_and_zero_memory_array_t_array$_t_uint256_$500_memory_ptr(length) -> memPtr
            {
                memPtr := allocate_memory_array_t_array$_t_uint256_$500_memory_ptr(length)
                let dataStart := memPtr
                let dataSize := array_allocation_size_t_array$_t_uint256_$500_memory_ptr(length)
                zero_memory_chunk_t_uint256(dataStart, dataSize)
            }
            function zero_value_for_split_t_array$_t_uint256_$500_memory_ptr() -> ret
            {
                ret := allocate_and_zero_memory_array_t_array$_t_uint256_$500_memory_ptr(500)
            }
            function array_allocation_size_t_array$_t_bool_$500_memory_ptr(length) -> size
            {
                if gt(length, 0xffffffffffffffff) { panic_error_0x41() }
                size := mul(length, 0x20)
            }
            function allocate_memory_array_t_array$_t_bool_$500_memory_ptr(length) -> memPtr
            {
                let allocSize := array_allocation_size_t_array$_t_bool_$500_memory_ptr(length)
                memPtr := allocate_memory(allocSize)
            }
            function zero_memory_chunk_t_bool(dataStart, dataSizeInBytes)
            {
                calldatacopy(dataStart, calldatasize(), dataSizeInBytes)
            }
            function allocate_and_zero_memory_array_t_array$_t_bool_$500_memory_ptr(length) -> memPtr
            {
                memPtr := allocate_memory_array_t_array$_t_bool_$500_memory_ptr(length)
                let dataStart := memPtr
                let dataSize := array_allocation_size_t_array$_t_bool_$500_memory_ptr(length)
                zero_memory_chunk_t_bool(dataStart, dataSize)
            }
            function zero_value_for_split_t_array$_t_bool_$500_memory_ptr() -> ret
            {
                ret := allocate_and_zero_memory_array_t_array$_t_bool_$500_memory_ptr(500)
            }
            /// @ast-id 40 @src 0:178:469  "function nredit(uint256 startindex)..."
            function fun_nredit_40(var_startindex_16) -> var_CIDs_21_mpos, var_dates_25_mpos, var_RIDs_29_mpos, var_Cboolas_33_mpos, var_amounts_37_mpos
            {
                /// @src 0:272:296  "uint256[500] memory CIDs"
                let zero_t_array$_t_uint256_$500_memory_ptr_1_mpos := zero_value_for_split_t_array$_t_uint256_$500_memory_ptr()
                var_CIDs_21_mpos := zero_t_array$_t_uint256_$500_memory_ptr_1_mpos
                /// @src 0:310:335  "uint256[500] memory dates"
                let zero_t_array$_t_uint256_$500_memory_ptr_2_mpos := zero_value_for_split_t_array$_t_uint256_$500_memory_ptr()
                var_dates_25_mpos := zero_t_array$_t_uint256_$500_memory_ptr_2_mpos
                /// @src 0:349:373  "uint256[500] memory RIDs"
                let zero_t_array$_t_uint256_$500_memory_ptr_3_mpos := zero_value_for_split_t_array$_t_uint256_$500_memory_ptr()
                var_RIDs_29_mpos := zero_t_array$_t_uint256_$500_memory_ptr_3_mpos
                /// @src 0:387:411  "bool[500] memory Cboolas"
                let zero_t_array$_t_bool_$500_memory_ptr_4_mpos := zero_value_for_split_t_array$_t_bool_$500_memory_ptr()
                var_Cboolas_33_mpos := zero_t_array$_t_bool_$500_memory_ptr_4_mpos
                /// @src 0:425:452  "uint256[500] memory amounts"
                let zero_t_array$_t_uint256_$500_memory_ptr_5_mpos := zero_value_for_split_t_array$_t_uint256_$500_memory_ptr()
                var_amounts_37_mpos := zero_t_array$_t_uint256_$500_memory_ptr_5_mpos
            }
            /// @src 0:0:1530  "contract C {..."
            function array_allocation_size_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr(length) -> size
            {
                if gt(length, 0xffffffffffffffff) { panic_error_0x41() }
                size := mul(length, 0x20)
            }
            function allocate_memory_array_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr(length) -> memPtr
            {
                let allocSize := array_allocation_size_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr(length)
                memPtr := allocate_memory(allocSize)
            }
            function array_allocation_size_t_array$_t_bytes32_$3_memory_ptr(length) -> size
            {
                if gt(length, 0xffffffffffffffff) { panic_error_0x41() }
                size := mul(length, 0x20)
            }
            function allocate_memory_array_t_array$_t_bytes32_$3_memory_ptr(length) -> memPtr
            {
                let allocSize := array_allocation_size_t_array$_t_bytes32_$3_memory_ptr(length)
                memPtr := allocate_memory(allocSize)
            }
            function zero_memory_chunk_t_bytes32(dataStart, dataSizeInBytes)
            {
                calldatacopy(dataStart, calldatasize(), dataSizeInBytes)
            }
            function allocate_and_zero_memory_array_t_array$_t_bytes32_$3_memory_ptr(length) -> memPtr
            {
                memPtr := allocate_memory_array_t_array$_t_bytes32_$3_memory_ptr(length)
                let dataStart := memPtr
                let dataSize := array_allocation_size_t_array$_t_bytes32_$3_memory_ptr(length)
                zero_memory_chunk_t_bytes32(dataStart, dataSize)
            }
            function zero_value_for_t_array$_t_bytes32_$3_memory_ptr() -> ret
            {
                ret := allocate_and_zero_memory_array_t_array$_t_bytes32_$3_memory_ptr(3)
            }
            function zero_complex_memory_array_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr(dataStart, dataSizeInBytes)
            {
                for { let i := 0 } lt(i, dataSizeInBytes) { i := add(i, 32) }
                {
                    mstore(add(dataStart, i), zero_value_for_t_array$_t_bytes32_$3_memory_ptr())
                }
            }
            function allocate_and_zero_memory_array_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr(length) -> memPtr
            {
                memPtr := allocate_memory_array_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr(length)
                let dataStart := memPtr
                let dataSize := array_allocation_size_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr(length)
                zero_complex_memory_array_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr(dataStart, dataSize)
            }
            function zero_value_for_split_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr() -> ret
            {
                ret := allocate_and_zero_memory_array_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr(500)
            }
            function array_allocation_size_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr(length) -> size
            {
                if gt(length, 0xffffffffffffffff) { panic_error_0x41() }
                size := mul(length, 0x20)
            }
            function allocate_memory_array_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr(length) -> memPtr
            {
                let allocSize := array_allocation_size_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr(length)
                memPtr := allocate_memory(allocSize)
            }
            function array_allocation_size_t_array$_t_bytes32_$2_memory_ptr(length) -> size
            {
                if gt(length, 0xffffffffffffffff) { panic_error_0x41() }
                size := mul(length, 0x20)
            }
            function allocate_memory_array_t_array$_t_bytes32_$2_memory_ptr(length) -> memPtr
            {
                let allocSize := array_allocation_size_t_array$_t_bytes32_$2_memory_ptr(length)
                memPtr := allocate_memory(allocSize)
            }
            function allocate_and_zero_memory_array_t_array$_t_bytes32_$2_memory_ptr(length) -> memPtr
            {
                memPtr := allocate_memory_array_t_array$_t_bytes32_$2_memory_ptr(length)
                let dataStart := memPtr
                let dataSize := array_allocation_size_t_array$_t_bytes32_$2_memory_ptr(length)
                zero_memory_chunk_t_bytes32(dataStart, dataSize)
            }
            function zero_value_for_t_array$_t_bytes32_$2_memory_ptr() -> ret
            {
                ret := allocate_and_zero_memory_array_t_array$_t_bytes32_$2_memory_ptr(2)
            }
            function zero_complex_memory_array_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr(dataStart, dataSizeInBytes)
            {
                for { let i := 0 } lt(i, dataSizeInBytes) { i := add(i, 32) }
                {
                    mstore(add(dataStart, i), zero_value_for_t_array$_t_bytes32_$2_memory_ptr())
                }
            }
            function allocate_and_zero_memory_array_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr(length) -> memPtr
            {
                memPtr := allocate_memory_array_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr(length)
                let dataStart := memPtr
                let dataSize := array_allocation_size_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr(length)
                zero_complex_memory_array_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr(dataStart, dataSize)
            }
            function zero_value_for_split_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr() -> ret
            {
                ret := allocate_and_zero_memory_array_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr(500)
            }
            /// @ast-id 92 @src 0:475:1021  "function return500InvoicesByDates(..."
            function fun_return500InvoicesByDates_92(var_begindate_42, var_enddate_44, var_startindex_46) -> var_AIDs_51_mpos, var_Aboolas_55_mpos, var_dates_59_mpos, var_Abytesas_65_mpos, var_bytesbs_71_mpos, var_bytescs_77_mpos, var_amounts_81_mpos, var_Aboolbs_85_mpos, var_Aboolcs_89_mpos
            {
                /// @src 0:653:677  "uint256[500] memory AIDs"
                let zero_t_array$_t_uint256_$500_memory_ptr_6_mpos := zero_value_for_split_t_array$_t_uint256_$500_memory_ptr()
                var_AIDs_51_mpos := zero_t_array$_t_uint256_$500_memory_ptr_6_mpos
                /// @src 0:691:715  "bool[500] memory Aboolas"
                let zero_t_array$_t_bool_$500_memory_ptr_7_mpos := zero_value_for_split_t_array$_t_bool_$500_memory_ptr()
                var_Aboolas_55_mpos := zero_t_array$_t_bool_$500_memory_ptr_7_mpos
                /// @src 0:729:754  "uint256[500] memory dates"
                let zero_t_array$_t_uint256_$500_memory_ptr_8_mpos := zero_value_for_split_t_array$_t_uint256_$500_memory_ptr()
                var_dates_59_mpos := zero_t_array$_t_uint256_$500_memory_ptr_8_mpos
                /// @src 0:768:799  "bytes32[3][500] memory Abytesas"
                let zero_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr_9_mpos := zero_value_for_split_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr()
                var_Abytesas_65_mpos := zero_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr_9_mpos
                /// @src 0:813:843  "bytes32[3][500] memory bytesbs"
                let zero_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr_10_mpos := zero_value_for_split_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr()
                var_bytesbs_71_mpos := zero_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr_10_mpos
                /// @src 0:857:887  "bytes32[2][500] memory bytescs"
                let zero_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr_11_mpos := zero_value_for_split_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr()
                var_bytescs_77_mpos := zero_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr_11_mpos
                /// @src 0:901:928  "uint256[500] memory amounts"
                let zero_t_array$_t_uint256_$500_memory_ptr_12_mpos := zero_value_for_split_t_array$_t_uint256_$500_memory_ptr()
                var_amounts_81_mpos := zero_t_array$_t_uint256_$500_memory_ptr_12_mpos
                /// @src 0:942:966  "bool[500] memory Aboolbs"
                let zero_t_array$_t_bool_$500_memory_ptr_13_mpos := zero_value_for_split_t_array$_t_bool_$500_memory_ptr()
                var_Aboolbs_85_mpos := zero_t_array$_t_bool_$500_memory_ptr_13_mpos
                /// @src 0:980:1004  "bool[500] memory Aboolcs"
                let zero_t_array$_t_bool_$500_memory_ptr_14_mpos := zero_value_for_split_t_array$_t_bool_$500_memory_ptr()
                var_Aboolcs_89_mpos := zero_t_array$_t_bool_$500_memory_ptr_14_mpos
            }
            /// @ast-id 138 @src 0:1027:1528  "function return500PaymentsByDates(..."
            function fun_return500PaymentsByDates_138(var_begindate_94, var_enddate_96, var_startindex_98) -> var_BIDs_103_mpos, var_dates_107_mpos, var_RIDs_111_mpos, var_Bboolas_115_mpos, var_bytesbs_121_mpos, var_bytescs_127_mpos, var_amounts_131_mpos, var_Bboolbs_135_mpos
            {
                /// @src 0:1205:1229  "uint256[500] memory BIDs"
                let zero_t_array$_t_uint256_$500_memory_ptr_15_mpos := zero_value_for_split_t_array$_t_uint256_$500_memory_ptr()
                var_BIDs_103_mpos := zero_t_array$_t_uint256_$500_memory_ptr_15_mpos
                /// @src 0:1243:1268  "uint256[500] memory dates"
                let zero_t_array$_t_uint256_$500_memory_ptr_16_mpos := zero_value_for_split_t_array$_t_uint256_$500_memory_ptr()
                var_dates_107_mpos := zero_t_array$_t_uint256_$500_memory_ptr_16_mpos
                /// @src 0:1282:1306  "uint256[500] memory RIDs"
                let zero_t_array$_t_uint256_$500_memory_ptr_17_mpos := zero_value_for_split_t_array$_t_uint256_$500_memory_ptr()
                var_RIDs_111_mpos := zero_t_array$_t_uint256_$500_memory_ptr_17_mpos
                /// @src 0:1320:1344  "bool[500] memory Bboolas"
                let zero_t_array$_t_bool_$500_memory_ptr_18_mpos := zero_value_for_split_t_array$_t_bool_$500_memory_ptr()
                var_Bboolas_115_mpos := zero_t_array$_t_bool_$500_memory_ptr_18_mpos
                /// @src 0:1358:1388  "bytes32[3][500] memory bytesbs"
                let zero_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr_19_mpos := zero_value_for_split_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr()
                var_bytesbs_121_mpos := zero_t_array$_t_array$_t_bytes32_$3_memory_ptr_$500_memory_ptr_19_mpos
                /// @src 0:1402:1432  "bytes32[2][500] memory bytescs"
                let zero_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr_20_mpos := zero_value_for_split_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr()
                var_bytescs_127_mpos := zero_t_array$_t_array$_t_bytes32_$2_memory_ptr_$500_memory_ptr_20_mpos
                /// @src 0:1446:1473  "uint256[500] memory amounts"
                let zero_t_array$_t_uint256_$500_memory_ptr_21_mpos := zero_value_for_split_t_array$_t_uint256_$500_memory_ptr()
                var_amounts_131_mpos := zero_t_array$_t_uint256_$500_memory_ptr_21_mpos
                /// @src 0:1487:1511  "bool[500] memory Bboolbs"
                let zero_t_array$_t_bool_$500_memory_ptr_22_mpos := zero_value_for_split_t_array$_t_bool_$500_memory_ptr()
                var_Bboolbs_135_mpos := zero_t_array$_t_bool_$500_memory_ptr_22_mpos
            }
        }
        data ".metadata" hex"a26469706673582212207c64339e742023f4753aec2d2ca06f3e0445c5f8dce5c89da1f68d51e61f477264736f6c634300080d0033"
    }
}

