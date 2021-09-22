Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id DD84D414C1E
	for <lists+cluster-devel@lfdr.de>; Wed, 22 Sep 2021 16:35:59 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-s5O7fQxHOliZ8ZOiqbXNew-1; Wed, 22 Sep 2021 10:35:57 -0400
X-MC-Unique: s5O7fQxHOliZ8ZOiqbXNew-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73D5E5075A;
	Wed, 22 Sep 2021 14:35:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FB7F794A2;
	Wed, 22 Sep 2021 14:35:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 075274EA30;
	Wed, 22 Sep 2021 14:35:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18MEZqGv029869 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 22 Sep 2021 10:35:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7ABBB2077FD7; Wed, 22 Sep 2021 14:35:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75CBA2077FD2
	for <cluster-devel@redhat.com>; Wed, 22 Sep 2021 14:35:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D26718A658A
	for <cluster-devel@redhat.com>; Wed, 22 Sep 2021 14:35:17 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.109.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-80-jPnXThghPZmyzdGUJBJtpw-1;
	Wed, 22 Sep 2021 10:35:15 -0400
X-MC-Unique: jPnXThghPZmyzdGUJBJtpw-1
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
	(mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-31-asNgbGPjMqe2RTEx7KoSjA-1; Wed, 22 Sep 2021 16:35:13 +0200
X-MC-Unique: asNgbGPjMqe2RTEx7KoSjA-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DB7PR04MB5979.eurprd04.prod.outlook.com (2603:10a6:10:8f::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4523.15; Wed, 22 Sep 2021 14:35:12 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d]) by DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d%6]) with mapi id 15.20.4523.018;
	Wed, 22 Sep 2021 14:35:12 +0000
To: David Teigland <teigland@redhat.com>
References: <20210919064322.1670-1-heming.zhao@suse.com>
	<20210920175736.GA19901@redhat.com>
	<d8d58ce5-6a38-9b76-8b9c-8e52e8760681@suse.com>
	<20210921135404.GA27196@redhat.com>
	<36d545a4-0551-6ab4-42da-0816020c4da6@suse.com>
	<20210922134636.GB6605@redhat.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <06d21489-36d3-c9c2-ae75-22fa550d860a@suse.com>
Date: Wed, 22 Sep 2021 22:35:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.14.0
In-Reply-To: <20210922134636.GB6605@redhat.com>
X-ClientProxiedBy: HKAPR04CA0006.apcprd04.prod.outlook.com
	(2603:1096:203:d0::16) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from c73.home (123.123.134.130) by
	HKAPR04CA0006.apcprd04.prod.outlook.com (2603:1096:203:d0::16)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14
	via Frontend Transport; Wed, 22 Sep 2021 14:35:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6317df6d-d298-4f91-02a0-08d97dd62f66
X-MS-TrafficTypeDiagnostic: DB7PR04MB5979:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB5979EC5AA070D8BF2C8CE11F97A29@DB7PR04MB5979.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: pMDtDIg5Ko9s+NPrW43FILZexJQ8wMsjjF8M4evBmNt0H/N6RmBMghmr5W/viJyP+nVsmOtg5DKTJtPT4g9mZn2RQonl4fS6Ndl2eMXbWBaoVQalEHunJ3xoMEwYe5y4/CVH+ZaRyG8a4J4rGh8evFMoByhH/MOX5GK1H66crGka/PoE7DPoQ46z/4Z7pexbl3jAjXQOFHKV2fHis/USC2zRSPn1Atxx+zgtVR4Hw0UxfQ7cD9xxV5W9g/siKzoSunPh6YEgEohxQLBC90ezH1feKbhHidVFJM6lCsuKGHRh/xItrO8KBokJwISaobbRW6Gc/gJbQQ2OAokVTgvaWZnS1JXsy9dQFuJ5/Q/Au8WHZGaHsNDS+gb5QLa0Cc+QGj3DdBnWvGpQrr4CY4xjA/Q/vo9QdPv3te050rnd0hqNOLTDlzLY5EDVIZZ3/tsI+NxGPYWlfqbxMw0/A37SWdh/q3j8A/nHKoRSgOse0dvpZYfN9H3SbvYoLc71OR/84LGY9zSJLPIpNB1rTz0ygoaU+C9jkKi36di3Zpue+IUAgwIhChIJ97sfoVV3G+qh6MNrNOf+pSzsCE5rI/kJdwBBZcJ1c2jiw12/8Xft86EKe6yQgPu3oegSr3CYNsobFlglKnXR8xhfTlwSCOzaOAaNKhFHdpqMlzwdvTZFl36Qo4A1+jtuHKoTIF4gvZoTMKsSuo/RilyykcQEnI+MDpbVuNXwA+rLCQzUvEqZ7Qr1RLcXNkJg9vaC+zbJqWO4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(6916009)(86362001)(8936002)(186003)(956004)(107886003)(316002)(83380400001)(6486002)(38100700002)(4326008)(53546011)(2906002)(36756003)(2616005)(8676002)(508600001)(66556008)(26005)(31686004)(31696002)(66946007)(66476007)(6512007)(6506007)(450100002)(6666004)(8886007)(4744005)(5660300002)(9126006)(45980500001)(43740500002);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cElFTTQ5bDgrYVB5MitoSU9OMTByaWFTclNya0xSTWcvVUdFRWIrcDlDWlp4?=
	=?utf-8?B?cS8wbnFIYVhsWlc1ZExZVlFZVTd5WllCTzRTTGM3SEpBNEJRa2lCWU4wNjVu?=
	=?utf-8?B?MlNtTDRuckkwSFEvd0ZaZXZmenR0czJnR3lKbFJvRUp6dWxuNlZRQWsvZWlM?=
	=?utf-8?B?WkNkUVpienI2ZHBZQVY4K3JldE55cEpvVGpMdTgwOUlSK0wxUjBsTWhQdEtz?=
	=?utf-8?B?L0cxTE4xNUVqWHpneXB6UHRoSVR0YlpkOWd5TEpwUUdTK2RkTG9oa1JMOW9W?=
	=?utf-8?B?ZnZvVzhPbU9tdnV5U1VGWDU1RU5TaDhmVzVUSTM1amxOak1sekRaRGdWaXFM?=
	=?utf-8?B?MVRSMW1kRUFBVDRPTS95NHlQT09BeGxxazdxS2dhbHkzTHd5MWF2RU11SWR5?=
	=?utf-8?B?WC9JRGNVNDNydFE1MjlJZUdmTjZWdjVWS29BOW5XanVYSUE3QTcyNFQ2bE5E?=
	=?utf-8?B?Y2F5MXl2VVVMLzZ2dzRGdEQ3NEN5ejlGSDFhUGhhTWl2WGR5dkt4N1JSNGRk?=
	=?utf-8?B?S0E1UGZUQVlzejF6czlHSjBOUmNZUlVlc2R4ejJPMVNjNXpobW41dkRKa21Z?=
	=?utf-8?B?aVBPbVZEYXhtUFRXNjhlM3B3MGVsbjByTGh0R3BuSXc4NDZVaFI3S1FTVDF6?=
	=?utf-8?B?c3ZVTFlyVU43OE9Vbi80MnBEeERuM1p5QkVYM3RrVUJTcHloVC9ibkt1SWEw?=
	=?utf-8?B?MU1ZZTJySGtEeW1xaFFYTU9nd2RSMnI0cDBuUmFzR2JXL1N0Wk1MSkVrd1lq?=
	=?utf-8?B?Z2RBL0tFUG1EVTdEaTBIM2hFci8zYkwyR1RCbkFEVGcvV0UxT3BKV1g4Z3U1?=
	=?utf-8?B?a2ZWSkN5Qy9Ua2paN3BPQTdmL0dndWFWUk02bldsd3hyS0FqQ3ZWQ1JvcC9M?=
	=?utf-8?B?RGRUUjk2Q2ZncEN2V0lONEVwNlQzNWU3a3k0alJQRDd6ZmRGSSt5WEcxc2J3?=
	=?utf-8?B?SUFPdWJnK01vQ2p4WlJ1eDNVTW5UTzF5QnRXVVFRYit4QVJNWnBZSWRSUHcz?=
	=?utf-8?B?K3FCSDdUWXNlZnNWQndCUHlvQUlCUjJwU2VrZ1Mva3N4cERidjZxZjhSYm1k?=
	=?utf-8?B?TWY1RkR5Y0xaeE1JUENSc0JPYzNQc2RJYXd4aVNGZlV5bjcxUm5PNXJnRW02?=
	=?utf-8?B?YklrV3VGRXBhVjlMREY4ZldjUHVZNDVFSkJyaUxoL0h5THB4RTJFM1VQb1d6?=
	=?utf-8?B?M01zbU5jb0VOVUN4T3NTdURMb2JvSis1aUpSa3VTazhGMXIzNW1EYjg1L3RZ?=
	=?utf-8?B?dm5sNDFnQnZ5UVRwbjBjQjhrWGNiSTBLYkpwblphbWdRVUNEVnVpNXJvZkRT?=
	=?utf-8?B?RGtKcmtuMFkrVnFtZkQrRzNzZGFkeDVVR01nODBCbjJtRmQxNU1lSHZ1Y0N0?=
	=?utf-8?B?eW5yMzJJUGZ6cTVHY3BpYnQzRWM3QnoxbUVmdWM0aEZNU0lWejh1VEZla3RM?=
	=?utf-8?B?RlFnQ0x3RGlZTlJnQUlaWm5LUVlOaEZTVHRTc0duM2FweVZqcWR5UnkrSWVG?=
	=?utf-8?B?eDdyalR4dVBETlpLcW5RcDQ0aFpMbGl4ZkpyQk9naG44enVUbU5keVIrU1lJ?=
	=?utf-8?B?akFsdCtYT2JTS0E1MlRYeWIrWUZxWnRnTjlseVpJNTNmc0s3M25vZEFVT0Ey?=
	=?utf-8?B?dXdiZElDSHRySEp1ZXRuVnJ6a1Nva1NUZFpncFZSbk1LaUYwT1IrSjcwWmJJ?=
	=?utf-8?B?WnR0R0h3UlZEeEJJN2NHZllHSXc1WXV5VHR2RUk4NThJYjM0U041d0FUdWox?=
	=?utf-8?Q?44xIB883uTeRWmakpqddbHqQ7aTVJ24v7y5aXky?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6317df6d-d298-4f91-02a0-08d97dd62f66
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 14:35:12.2820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /otLAZnIuneANqHzAsF9LvXSKgg0BQJG8/MvQ+TSHrtMmdsz5QfTtPet1RlbQGtYvEKkF2PEP00vkNNIMgCjMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5979
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, zzhou@suse.com
Subject: Re: [Cluster-devel] [RFC PATCH dlm 00/10] dlm_controld config
	settings can be
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/22/21 9:46 PM, David Teigland wrote:
> On Wed, Sep 22, 2021 at 05:32:49PM +0800, heming.zhao@suse.com wrote:
>> If there is no chance to add dynamic updating setting by run command.
>> Is it a good idea to add a parameter "-I", like "dlm_tool -I reload_config".
>> "-I" means directly change without reading from dlm.conf.
>> When users want to restore the original setting, run "dlm_tool reload_config"
>> (without "-I") to override with predefined/default values.
> 
> How about "dlm_tool set_config x=y" to make a temporary change in
> dlm_controld, and "dlm_tool reload_config" to reread dlm.conf.
> Dave
> 

Yes, "set_config x=y" is more better.
I just found I missed part of parameter of "-I reload_config". The whole
cmd should be "-I reload_config x=y". But add a new command is more clear
and better.

Heming

