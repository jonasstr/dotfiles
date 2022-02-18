#include <linux/build-salt.h>
#include <linux/module.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

BUILD_SALT;

MODULE_INFO(vermagic, VERMAGIC_STRING);
MODULE_INFO(name, KBUILD_MODNAME);

__visible struct module __this_module
__section(.gnu.linkonce.this_module) = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};

#ifdef CONFIG_RETPOLINE
MODULE_INFO(retpoline, "Y");
#endif

static const struct modversion_info ____versions[]
__used __section(__versions) = {
	{ 0xb3753869, "module_layout" },
	{ 0x609f1c7e, "synchronize_net" },
	{ 0x3ce4ca6f, "disable_irq" },
	{ 0x2d3385d3, "system_wq" },
	{ 0xc08ffb53, "netdev_info" },
	{ 0xf7d2d6a1, "pci_write_config_dword" },
	{ 0xeb233a45, "__kmalloc" },
	{ 0x17e87c4f, "ethtool_op_get_ts_info" },
	{ 0xf9a482f9, "msleep" },
	{ 0xe029c9c, "skb_clone_tx_timestamp" },
	{ 0x63288b9a, "pci_write_config_word" },
	{ 0xf6fa2eb9, "single_open" },
	{ 0x5ab5b891, "param_ops_int" },
	{ 0xb1c0a7a6, "napi_disable" },
	{ 0x96de5410, "pci_read_config_byte" },
	{ 0x59605973, "napi_consume_skb" },
	{ 0x71fded2d, "napi_schedule_prep" },
	{ 0x8f996a30, "ethtool_convert_legacy_u32_to_link_mode" },
	{ 0x79aa04a2, "get_random_bytes" },
	{ 0xd8fd6a9a, "dma_set_mask" },
	{ 0xbc593268, "dev_printk" },
	{ 0x3700313a, "single_release" },
	{ 0xad9670f1, "seq_puts" },
	{ 0xae630ce8, "pci_disable_device" },
	{ 0xc7a4fbed, "rtnl_lock" },
	{ 0x478cc26a, "pci_disable_msix" },
	{ 0xecaf5c8a, "netif_carrier_on" },
	{ 0xffeedf6a, "delayed_work_timer_fn" },
	{ 0xd981b7ff, "seq_printf" },
	{ 0x9d9b5eb4, "netif_carrier_off" },
	{ 0x56470118, "__warn_printk" },
	{ 0xbddf62d2, "dma_direct_sync_single_for_cpu" },
	{ 0x78fed34, "pci_write_config_byte" },
	{ 0x34c36bf5, "__dev_kfree_skb_any" },
	{ 0xeae3dfd6, "__const_udelay" },
	{ 0x7154900d, "pci_release_regions" },
	{ 0xc6f46339, "init_timer_key" },
	{ 0x9fa7184a, "cancel_delayed_work_sync" },
	{ 0x8127e80b, "pci_enable_wake" },
	{ 0x2b54d1d5, "dma_free_attrs" },
	{ 0x4629334c, "__preempt_count" },
	{ 0x7a2af7b4, "cpu_number" },
	{ 0x97651e6c, "vmemmap_base" },
	{ 0x4e22ab94, "seq_read" },
	{ 0x36e58bcd, "pv_ops" },
	{ 0x32ffdcca, "dma_set_coherent_mask" },
	{ 0xc66cf97f, "netif_napi_del" },
	{ 0xeaee8786, "__netdev_alloc_skb" },
	{ 0xb47cca30, "csum_ipv6_magic" },
	{ 0xb44ad4b3, "_copy_to_user" },
	{ 0xe8c07ff2, "PDE_DATA" },
	{ 0xfee56dca, "pci_set_master" },
	{ 0xfb578fc5, "memset" },
	{ 0x3c9db9ca, "proc_mkdir" },
	{ 0x240a49d2, "netif_tx_wake_queue" },
	{ 0xa714a55b, "pci_restore_state" },
	{ 0x4c0d835c, "netif_tx_stop_all_queues" },
	{ 0xc5850110, "printk" },
	{ 0x3c3fce39, "__local_bh_enable_ip" },
	{ 0x4c9d28b0, "phys_base" },
	{ 0x6700be79, "register_netdev" },
	{ 0xb203c6a5, "seq_putc" },
	{ 0xbdefdccb, "pci_read_config_word" },
	{ 0x5792f848, "strlcpy" },
	{ 0x37805d7b, "dma_direct_map_page" },
	{ 0xfda0bdf3, "dma_alloc_attrs" },
	{ 0x69dd3b5b, "crc32_le" },
	{ 0x46f152b6, "proc_mkdir_data" },
	{ 0x1fa62540, "netif_set_real_num_rx_queues" },
	{ 0xc893a848, "netif_set_real_num_tx_queues" },
	{ 0xd9a7e9c7, "netif_napi_add" },
	{ 0x2072ee9b, "request_threaded_irq" },
	{ 0x3dd1b99b, "init_net" },
	{ 0xe6257e29, "_dev_err" },
	{ 0xdd69547d, "pci_enable_msi" },
	{ 0x78041b8f, "byte_rev_table" },
	{ 0x276940fc, "pci_clear_master" },
	{ 0xe523ad75, "synchronize_irq" },
	{ 0x930b54a9, "pci_find_capability" },
	{ 0x45aa05f5, "pci_set_mwi" },
	{ 0x7cd8d75e, "page_offset_base" },
	{ 0x55e31703, "ethtool_convert_link_mode_to_legacy_u32" },
	{ 0xc6cbbc89, "capable" },
	{ 0x9e163a88, "dma_direct_unmap_page" },
	{ 0x8d49a5f7, "netif_device_attach" },
	{ 0x8104bca3, "napi_gro_receive" },
	{ 0x9409627e, "_dev_info" },
	{ 0xf1036f24, "pci_disable_link_state" },
	{ 0x3de31761, "netif_device_detach" },
	{ 0x93a219c, "ioremap_nocache" },
	{ 0xa48eeadc, "pci_enable_msix_range" },
	{ 0x7478c9a1, "__napi_schedule" },
	{ 0xb2fcb56d, "queue_delayed_work_on" },
	{ 0xdecd0b29, "__stack_chk_fail" },
	{ 0x9cb986f2, "vmalloc_base" },
	{ 0x315fb765, "skb_checksum_help" },
	{ 0xd1562ed1, "napi_complete_done" },
	{ 0x2ea2c95c, "__x86_indirect_thunk_rax" },
	{ 0xbfdcb43a, "__x86_indirect_thunk_r11" },
	{ 0x2d5e3af0, "pci_read_config_dword" },
	{ 0xa7703eea, "eth_type_trans" },
	{ 0x58b7d7b2, "proc_get_parent_data" },
	{ 0x38c0115f, "dev_driver_string" },
	{ 0x7bcbaf39, "pskb_expand_head" },
	{ 0xbdfb6dbb, "__fentry__" },
	{ 0x60a8ac7a, "netdev_err" },
	{ 0x478f00e1, "pci_unregister_driver" },
	{ 0xdbf17652, "_raw_spin_lock" },
	{ 0xf6ebc03b, "net_ratelimit" },
	{ 0x2d4bdeb8, "pci_set_power_state" },
	{ 0x97eba9f4, "remove_proc_subtree" },
	{ 0xab62e5d0, "proc_create_data" },
	{ 0x4dad05ff, "pci_clear_mwi" },
	{ 0xf77b56e2, "seq_lseek" },
	{ 0xfcec0987, "enable_irq" },
	{ 0x37a0cba, "kfree" },
	{ 0x69acdf38, "memcpy" },
	{ 0xedf4f48c, "pci_request_regions" },
	{ 0xf83c1282, "pci_disable_msi" },
	{ 0xedc03953, "iounmap" },
	{ 0x2901eed3, "pci_prepare_to_sleep" },
	{ 0xb893b480, "dma_direct_sync_single_for_device" },
	{ 0x24694125, "__pci_register_driver" },
	{ 0x15af7f4, "system_state" },
	{ 0xc041bda5, "unregister_netdev" },
	{ 0x656e4a6e, "snprintf" },
	{ 0x116c8d71, "consume_skb" },
	{ 0x145f00f6, "netdev_update_features" },
	{ 0x85670f1d, "rtnl_is_locked" },
	{ 0x9be5a20f, "__napi_alloc_skb" },
	{ 0x74e41a24, "skb_tstamp_tx" },
	{ 0x21d43104, "skb_put" },
	{ 0x42980214, "pci_enable_device" },
	{ 0x78d4405d, "pci_wake_from_d3" },
	{ 0x362ef408, "_copy_from_user" },
	{ 0xe23f4d3, "param_ops_ulong" },
	{ 0x999f25e3, "param_ops_uint" },
	{ 0x7aae56f8, "skb_copy_bits" },
	{ 0x6e720ff2, "rtnl_unlock" },
	{ 0xdd7bab0c, "dma_ops" },
	{ 0x763bb516, "__skb_pad" },
	{ 0xec0542d, "device_set_wakeup_enable" },
	{ 0xc1514a3b, "free_irq" },
	{ 0x55842ec1, "pci_save_state" },
	{ 0xe914e41e, "strcpy" },
	{ 0x57281fa4, "alloc_etherdev_mqs" },
};

MODULE_INFO(depends, "");

MODULE_ALIAS("pci:v000010ECd00008125sv*sd*bc*sc*i*");
MODULE_ALIAS("pci:v000010ECd00008162sv*sd*bc*sc*i*");
MODULE_ALIAS("pci:v000010ECd00003000sv*sd*bc*sc*i*");

MODULE_INFO(srcversion, "30566BA1204ACBB5BEC1955");
