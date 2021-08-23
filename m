Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id E8C893F44AC
	for <lists+cluster-devel@lfdr.de>; Mon, 23 Aug 2021 07:42:55 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-SJ9Q0aIVOPuOC1LMuSk_HA-1; Mon, 23 Aug 2021 01:42:48 -0400
X-MC-Unique: SJ9Q0aIVOPuOC1LMuSk_HA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C29931008071;
	Mon, 23 Aug 2021 05:42:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9212100EBAD;
	Mon, 23 Aug 2021 05:42:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4E0D2181A0F7;
	Mon, 23 Aug 2021 05:42:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17N5gaW1002837 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 23 Aug 2021 01:42:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 936851005B63; Mon, 23 Aug 2021 05:42:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EAF01003211
	for <cluster-devel@redhat.com>; Mon, 23 Aug 2021 05:42:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33241800677
	for <cluster-devel@redhat.com>; Mon, 23 Aug 2021 05:42:32 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.109.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-435-gmU2T0d5Mwyxu6DBgnINhA-1;
	Mon, 23 Aug 2021 01:42:29 -0400
X-MC-Unique: gmU2T0d5Mwyxu6DBgnINhA-1
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur02lp2053.outbound.protection.outlook.com [104.47.5.53])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-39-0a0nvLvCNT21nKoWfme62w-1; Mon, 23 Aug 2021 07:42:27 +0200
X-MC-Unique: 0a0nvLvCNT21nKoWfme62w-1
Received: from AM6PR04MB6488.eurprd04.prod.outlook.com (2603:10a6:20b:f8::21)
	by AM5PR04MB3076.eurprd04.prod.outlook.com (2603:10a6:206:5::25) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22;
	Mon, 23 Aug 2021 05:42:26 +0000
Received: from AM6PR04MB6488.eurprd04.prod.outlook.com
	([fe80::793c:6276:4f2a:4d71]) by
	AM6PR04MB6488.eurprd04.prod.outlook.com
	([fe80::793c:6276:4f2a:4d71%4]) with mapi id 15.20.4436.024;
	Mon, 23 Aug 2021 05:42:26 +0000
From: Gang He <GHe@suse.com>
To: "cluster-devel@redhat.com" <cluster-devel@redhat.com>
Thread-Topic: FS/DLM module triggered kernel BUG
Thread-Index: AQHXl9/0jQ+gIj4McUuYi/mVSYw7CA==
Date: Mon, 23 Aug 2021 05:42:26 +0000
Message-ID: <AM6PR04MB64883088DB106BD3BC49B216CFC49@AM6PR04MB6488.eurprd04.prod.outlook.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d406cf6-d929-4f55-0b2c-08d965f8c9eb
x-ms-traffictypediagnostic: AM5PR04MB3076:
x-microsoft-antispam-prvs: <AM5PR04MB307641E8E9B1E069094F3734CFC49@AM5PR04MB3076.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: boXRmVG+YSC/xQ5LDe48W9YXiM5/51YM+6weA12RE86Did7nroIWt1yBsGdKw9+htNn9hEx3XQAeaI1dRhVmHL5uj+Mxhz0BU9N+t2obMHA9R4UjMC7BT5JtzKZiolcEbIofmvxn59+12Fls/551qo+9gfFch1/0b/askaroMtYgjQw25hMnlH5/t9XtkHhv/m81swyOPU8SuSLxcEXsdALbwwGy2/6sPqRNJkGn7LrlHB54HmKdp22sAOvHWzPzzaG6aVfolQYDmJAsBdJWgZun+hsvLY/Gi9M/+QmQywo2OqHuTBGA3n/8Y4Ef0aaYT/wyenxz9KK4hB4QHvOgv7avHp/pBMZEpX+yAfScWhD8QssgDi6Gz3SLAwMIeiRGVUpT7aWZYWjgi1xvmNWlNlfNpJW2K2q0MzDq1Cb8qGUjD0dpqK9XVFD2O3Xz5SGuq3sFZw4SGMScQv7aKGOslnbD93Zss2QEGzigrphEXYBDGpEOpr+Qdy/z3WZdqwp07JpAFwYAzcAbH0HDY/bHCQYYxZoMHL+euTElNRj+t49c4MG54aIKrkIY68blbyoWAtTnvUCpnKenZJaqdP7O/070AVidnMDnKKU5WTKpZ9bZrHItawHZMPfPVSWnYBMudg7ezpZJr7uMGEAin6G4xCVVT4tErS38aem1rV/4vc5Vn6xr70jVj1HhQUvSf1MgePL1lgKIRN87cu5N27xEBA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:AM6PR04MB6488.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(39850400004)(366004)(136003)(376002)(346002)(396003)(9686003)(83380400001)(122000001)(52536014)(186003)(76116006)(478600001)(91956017)(45080400002)(38070700005)(55016002)(66946007)(38100700002)(66476007)(8676002)(316002)(26005)(71200400001)(8936002)(5660300002)(66556008)(64756008)(66446008)(55236004)(6506007)(86362001)(7696005)(2906002)(33656002)(6916009);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ZL3zW2BWHel1Gn1k2WgC1N4qyW3JuKqHWkOJLz8kJ/P/pMjnzZMqvnE2Q4?=
	=?iso-8859-1?Q?ebHnkrauY83UNu8aZ0i5ORFxnLI8dfU0Xzt6UIn8GO/2+msnSyTXZvQYxL?=
	=?iso-8859-1?Q?xZN/Kk8SA9uueC+tDvFZUiSVASu8A++1sKHXkptQ1gBxAgJrEyG+IoDstt?=
	=?iso-8859-1?Q?oVmommKxT732M3t4UrjhjmXDzCxkeBQmGL3W6hVHQyxe3+YtzcETElkObv?=
	=?iso-8859-1?Q?tk0MgEFwXssKdPU4VPvaK4/MO+eat/aYWIlMAglzPqvMhYYsgbb4mdYrIE?=
	=?iso-8859-1?Q?axnVRpI4CNMgXwOjlZSeBnU2Ndwrr8YdgvosKtTXTxTtssdYacXrBholpB?=
	=?iso-8859-1?Q?tHakLgdckyUYcrAkR3bJK2fj3DqK+CnzMNw+A3020sN9LR8vS1mMy4rmWU?=
	=?iso-8859-1?Q?pwxuKLTbP3iCArNfKcK8PijJAeyqYusdq4+yzemkPBM7ZT6wHop2ycx800?=
	=?iso-8859-1?Q?Oxn0jeYdx3dF/vepQORfxGWyOfM9j0zGsQ+zaw9DGRm5oo0SXUx+EfeQZI?=
	=?iso-8859-1?Q?R1UYQokg+1uMmVLphUDdb1+XonWiksRKtboaJszSKUpXypDoROq/USyAp7?=
	=?iso-8859-1?Q?cbEHX32vGtD9wSTcQHWu/I4VQE9Gvkpef2Hf9FKsvpsNtuooKK/pD9VFCv?=
	=?iso-8859-1?Q?aZ19MEzYj3gdV6ZKuNiGTnLGiNK2pdn+NzI49LguTt8cvaclw4ronZfmwp?=
	=?iso-8859-1?Q?oLj2OeXNCZGkZKFCcZskMgSFd89ceO7IywHraxO++ypA4VI3bDK1Vy4tDs?=
	=?iso-8859-1?Q?K+8ZtcbRiXbqm10LG7yeHRkI0NG5ehDmfNZKlMicHMTA/OZ79m7I3pEYHK?=
	=?iso-8859-1?Q?Pw6k3OZkH0EiDMawdhWYDia4H4f1bcQTxnrOzYT7KOBVJ3sfFe0pO/Axq2?=
	=?iso-8859-1?Q?1frmMDQw4TBBfRbFfK+1e3lxjAHYzwQoFAf3/li7F7PkoTXrif4SFoOYMV?=
	=?iso-8859-1?Q?YNSnZI3vk8wXoy+85AofGyU0tlmpFAPmomar2lPriaN5OzRvmDCDeoRRIo?=
	=?iso-8859-1?Q?Xn1tVZIOAELyIhlUPmpKi0Yg+rSb7pFJCA56ff1cGhlTyzqiStpUlSpMEu?=
	=?iso-8859-1?Q?yo5lWp/z+tUuXTfGMwUcmrJBiLChDXWVLDb4FkWy3Cdz6FfeKVyBazLieX?=
	=?iso-8859-1?Q?Cr2DTfiPgMKCi4pYCGO0SZ0rIUwv9SZ4sU3OpRbA67DIkN0+IZbVTZz0vf?=
	=?iso-8859-1?Q?8fPeWhPRhLCS0tWTjJBd7Sp7NcHnrOUDqb+94i08ReeguUG9ELUcR/44+H?=
	=?iso-8859-1?Q?05A5qmVYhDbAyqz8YpuoleoCApVUHZ2e573evYyzAiObc+SEdIFhU0Dn2u?=
	=?iso-8859-1?Q?hB7YkU17vCFWkRYUPbGjJjryoBubMKsQIT7G2ehy+TDabwg=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6488.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d406cf6-d929-4f55-0b2c-08d965f8c9eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2021 05:42:26.2965 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aCAcx4UCTKwMaNSeY1gdeAm7+BIUCsR4kG6+I08Y7Ln/NbU0S3Dt6jhbJY/TZKw4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3076
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 17N5gaW1002837
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] FS/DLM module triggered kernel BUG
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit

Hello Guys,

I used kernel 5.13.8, I sometimes encountered the dlm module triggered kernel BUG.
Since the dlm kernel module is not the latest source code, I am not sure if this problem is fixed, or not. 

The backtrace is as below,

[Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: remove member 172204615
[Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: dlm_recover_members 2 nodes
[Fri Aug 20 16:24:14 2021] dlm: connection 000000005ef82293 got EOF from 172204615
[Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: generation 4 slots 2 1:172204786 2:172204748
[Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: dlm_recover_directory
[Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: dlm_recover_directory 8 in 1 new
[Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: dlm_recover_directory 1 out 1 messages
[Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: dlm_recover_masters
[Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: dlm_recover_masters 33587 of 33599
[Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: dlm_recover_locks 0 out
[Fri Aug 20 16:24:14 2021] BUG: unable to handle page fault for address: ffffdd99ffd16650
[Fri Aug 20 16:24:14 2021] #PF: supervisor write access in kernel mode
[Fri Aug 20 16:24:14 2021] #PF: error_code(0x0002) - not-present page
[Fri Aug 20 16:24:14 2021] PGD 1040067 P4D 1040067 PUD 19c3067 PMD 19c4067 PTE 0
[Fri Aug 20 16:24:14 2021] Oops: 0002 [#1] SMP PTI
[Fri Aug 20 16:24:14 2021] CPU: 1 PID: 25221 Comm: kworker/u4:1 Tainted: G        W         5.13.8-1-default #1 openSUSE Tumbleweed
[Fri Aug 20 16:24:14 2021] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.9.1-0-gb3ef39f-prebuilt.qemu-project.org 04/01/2014
[Fri Aug 20 16:24:14 2021] Workqueue: dlm_recv process_recv_sockets [dlm]
[Fri Aug 20 16:24:14 2021] RIP: 0010:__srcu_read_unlock+0x15/0x20
[Fri Aug 20 16:24:14 2021] Code: 01 65 48 ff 04 c2 f0 83 44 24 fc 00 44 89 c0 c3 0f 1f 44 00 00 0f 1f 44 00 00 f0 83 44 24 fc 00 48 8b 87 e8 0c 00 00 48 63 f6 <65> 48 ff 44 f0 10 c3 0f 1f 40 00 0f 1f 44 00 00 41 54 49 89 fc 55
[Fri Aug 20 16:24:14 2021] RSP: 0018:ffffbd9a041ebd80 EFLAGS: 00010282
[Fri Aug 20 16:24:14 2021] RAX: 00003cc9c100ec00 RBX: 00000000000000dc RCX: 0000000000000830
[Fri Aug 20 16:24:14 2021] RDX: 0000000000000000 RSI: 0000000000000f48 RDI: ffffffffc06b4420
[Fri Aug 20 16:24:14 2021] RBP: ffffa0d028423974 R08: 0000000000000001 R09: 0000000000000004
[Fri Aug 20 16:24:14 2021] R10: 0000000000000000 R11: 0000000000000000 R12: ffffa0d028425000
[Fri Aug 20 16:24:14 2021] R13: 000000000a43a2f2 R14: ffffa0d028425770 R15: 000000000a43a2f2
[Fri Aug 20 16:24:14 2021] FS:  0000000000000000(0000) GS:ffffa0d03ed00000(0000) knlGS:0000000000000000
[Fri Aug 20 16:24:14 2021] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[Fri Aug 20 16:24:14 2021] CR2: ffffdd99ffd16650 CR3: 0000000002696000 CR4: 00000000000406e0
[Fri Aug 20 16:24:14 2021] Call Trace:
[Fri Aug 20 16:24:14 2021]  dlm_receive_buffer+0x66/0x150 [dlm]
[Fri Aug 20 16:24:14 2021]  dlm_process_incoming_buffer+0x38/0x90 [dlm]
[Fri Aug 20 16:24:14 2021]  receive_from_sock+0xd4/0x1f0 [dlm]
[Fri Aug 20 16:24:14 2021]  process_recv_sockets+0x1a/0x20 [dlm]
[Fri Aug 20 16:24:14 2021]  process_one_work+0x1df/0x370
[Fri Aug 20 16:24:14 2021]  worker_thread+0x50/0x400
[Fri Aug 20 16:24:14 2021]  ? process_one_work+0x370/0x370
[Fri Aug 20 16:24:14 2021]  kthread+0x127/0x150
[Fri Aug 20 16:24:14 2021]  ? set_kthread_struct+0x40/0x40
[Fri Aug 20 16:24:14 2021]  ret_from_fork+0x22/0x30
[Fri Aug 20 16:24:14 2021] Modules linked in: rdma_ucm ib_uverbs rdma_cm iw_cm ib_cm ib_core ocfs2_stack_user ocfs2 ocfs2_nodemanager ocfs2_stackglue quota_tree dlm af_packet iscsi_ibft iscsi_boot_sysfs rfkill intel_rapl_msr hid_generic intel_rapl_common usbhid virtio_net pcspkr joydev net_failover virtio_balloon i2c_piix4 failover tiny_power_button button fuse configfs crct10dif_pclmul crc32_pclmul ghash_clmulni_intel ata_generic uhci_hcd ehci_pci ehci_hcd cirrus drm_kms_helper aesni_intel usbcore crypto_simd syscopyarea sysfillrect sysimgblt fb_sys_fops cec cryptd rc_core drm serio_raw i6300esb virtio_blk ata_piix floppy qemu_fw_cfg btrfs blake2b_generic libcrc32c crc32c_intel xor raid6_pq sg dm_multipath dm_mod scsi_dh_rdac scsi_dh_emc scsi_dh_alua virtio_rng
[Fri Aug 20 16:24:14 2021] CR2: ffffdd99ffd16650
[Fri Aug 20 16:24:14 2021] ---[ end trace 2ddfa38b9d824d93 ]---
[Fri Aug 20 16:24:14 2021] RIP: 0010:__srcu_read_unlock+0x15/0x20
[Fri Aug 20 16:24:14 2021] Code: 01 65 48 ff 04 c2 f0 83 44 24 fc 00 44 89 c0 c3 0f 1f 44 00 00 0f 1f 44 00 00 f0 83 44 24 fc 00 48 8b 87 e8 0c 00 00 48 63 f6 <65> 48 ff 44 f0 10 c3 0f 1f 40 00 0f 1f 44 00 00 41 54 49 89 fc 55
[Fri Aug 20 16:24:14 2021] RSP: 0018:ffffbd9a041ebd80 EFLAGS: 00010282
[Fri Aug 20 16:24:14 2021] RAX: 00003cc9c100ec00 RBX: 00000000000000dc RCX: 0000000000000830
[Fri Aug 20 16:24:14 2021] RDX: 0000000000000000 RSI: 0000000000000f48 RDI: ffffffffc06b4420
[Fri Aug 20 16:24:14 2021] RBP: ffffa0d028423974 R08: 0000000000000001 R09: 0000000000000004
[Fri Aug 20 16:24:14 2021] R10: 0000000000000000 R11: 0000000000000000 R12: ffffa0d028425000
[Fri Aug 20 16:24:14 2021] R13: 000000000a43a2f2 R14: ffffa0d028425770 R15: 000000000a43a2f2
[Fri Aug 20 16:24:14 2021] FS:  0000000000000000(0000) GS:ffffa0d03ed00000(0000) knlGS:0000000000000000
[Fri Aug 20 16:24:14 2021] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[Fri Aug 20 16:24:14 2021] CR2: ffffdd99ffd16650 CR3: 0000000002696000 CR4: 00000000000406e0

Thanks
Gang


