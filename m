Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id ACDE5414534
	for <lists+cluster-devel@lfdr.de>; Wed, 22 Sep 2021 11:33:30 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-RciyfUOhNAC-TTwuMb1lyg-1; Wed, 22 Sep 2021 05:33:27 -0400
X-MC-Unique: RciyfUOhNAC-TTwuMb1lyg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E917100CCC6;
	Wed, 22 Sep 2021 09:33:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DBA7A60BF4;
	Wed, 22 Sep 2021 09:33:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BE88B1801241;
	Wed, 22 Sep 2021 09:33:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18M9XCYJ030092 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 22 Sep 2021 05:33:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E1194F3D2B; Wed, 22 Sep 2021 09:33:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFF21F4ECD
	for <cluster-devel@redhat.com>; Wed, 22 Sep 2021 09:33:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96466100B8DC
	for <cluster-devel@redhat.com>; Wed, 22 Sep 2021 09:33:06 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.109.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-104-j99VJ70MOLewQCGRJNr_bQ-1;
	Wed, 22 Sep 2021 05:33:02 -0400
X-MC-Unique: j99VJ70MOLewQCGRJNr_bQ-1
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
	(mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-39-MXkqdNpmO6uPR-z5obBRHQ-1; Wed, 22 Sep 2021 11:33:00 +0200
X-MC-Unique: MXkqdNpmO6uPR-z5obBRHQ-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DBBPR04MB6090.eurprd04.prod.outlook.com (2603:10a6:10:c4::22) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4523.18; Wed, 22 Sep 2021 09:32:59 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d]) by DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d%6]) with mapi id 15.20.4523.018;
	Wed, 22 Sep 2021 09:32:58 +0000
To: David Teigland <teigland@redhat.com>
References: <20210919064322.1670-1-heming.zhao@suse.com>
	<20210920175736.GA19901@redhat.com>
	<d8d58ce5-6a38-9b76-8b9c-8e52e8760681@suse.com>
	<20210921135404.GA27196@redhat.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <36d545a4-0551-6ab4-42da-0816020c4da6@suse.com>
Date: Wed, 22 Sep 2021 17:32:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.14.0
In-Reply-To: <20210921135404.GA27196@redhat.com>
X-ClientProxiedBy: HKAPR03CA0035.apcprd03.prod.outlook.com
	(2603:1096:203:c9::22) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from c73.home (123.123.134.130) by
	HKAPR03CA0035.apcprd03.prod.outlook.com (2603:1096:203:c9::22)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.7
	via Frontend Transport; Wed, 22 Sep 2021 09:32:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68d0ffea-8f13-4648-9b39-08d97dabf6f7
X-MS-TrafficTypeDiagnostic: DBBPR04MB6090:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB6090E6631B57302C3B01A71D97A29@DBBPR04MB6090.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: dw/E04+DUam1KwyPDrO03wZnub8GyfvTLValMQXEhAVFY2gKJM2eT1PMXSdGVC+BW/QupneAQ9uOQgAyMlLujRM+oDTxwUAmI63MMhVAOpoVgqtUCHO/C0NRXe0PcMSaWHghRyeLO6NLiap6r4iqV+Miy4ut0pS0bIg+YLZR7n1hphoHOommClu7Khh9KZ3vhohzrYRXyLNh+qbuQZsibJamHUX6yeS5sliIEEq7dcEVEMC4aIRu9d4w/akl8UjsTgD4Y53C64yWcczTMIOpRn25LV8aGwh55zqyI45UmNXfZ/X2VMMLZAQoBmbWNV5Mu+0GgHgAM+RM8p5vK0nUz/fvdNb8jg9FCxKUa3iK111sD7pIBNpRvukiOV23D4yni6Otkd9OgJuRN3RW70u4CzwEEcmDw2nh/XXWn7AfLPcP/rfoqnYd4nf0h1UHvNgZkTII2/937uaMMYCMJmMA79vyPLbI/qvotQeqS/TQ1eilIKXuZO28TQDtjEWsENWWoGRGcxSxq/qRJUqEx36cRlV18t83lZ0rlFNPXTHG2q1fwkZ4+7JxW2yIXX5ENJpuNNssLoWFqqocalV1hVG4ERIuOsfd/OyPTDzPJQMEIfL7myUd9QeM7NX+Dho1In8YMHauMU23H/Jv9vR8u6UzeysL0qams9IUGDZzVPu+xdejXEXK0UzrTkunMwVaFLbOaOp5SzHay0PNXVYRCww3D0n92jviWrDNDWoNmEGvmBcK4WPfoW/rq8MeQdnjo/Us
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(83380400001)(31696002)(450100002)(86362001)(316002)(6916009)(31686004)(6512007)(956004)(8936002)(66556008)(6506007)(66946007)(8676002)(8886007)(6666004)(38100700002)(66476007)(186003)(508600001)(4326008)(2616005)(36756003)(6486002)(5660300002)(53546011)(26005)(2906002)(107886003)(9126006)(45980500001)(43740500002);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjhGZDNrRUszRFNIMnlUZkFDNE02cU8rZzVwSTBvUkNrR0JDajN3dkllUU12?=
	=?utf-8?B?YWhiUGUxVFdUSHV6dUh2VkJGemFkTzhFTTVsSS8rbE0wQXhRbmNXTndiaW5j?=
	=?utf-8?B?ckRZVlo5YisvZm81a1p2T3FMaEl2bzJNTDZyU09nOGdrODIvcFlkNExXbWZp?=
	=?utf-8?B?ekhuWW5qMEEzaDU5VWRrdTdYMmVIWVFtVDdVYWo4WmdCQldRVXQvWVJSQldl?=
	=?utf-8?B?ZkJ0VlNiVUQzcURsbHlvOG9HM1h1WHNoMmFiNlBrQXo4bENXV3RKdUlWMEhy?=
	=?utf-8?B?YXlQK0orNHNwdXc5UFNKYzMramVGRVk3VTVPN1VtYkxhS1dvR25YYjZUNXQ5?=
	=?utf-8?B?YVhOL0tBTkpRdGRraDVPUWlyRDkvY1A5Y3RHMzM0a0Rvc3E1THdqTlhoZHRO?=
	=?utf-8?B?a2l3OXE2SlprR29kNFFIZGtSZGQ4TG1BMm5kRHdjTVAyQlZwT21XV2E4bHhn?=
	=?utf-8?B?amk5ZkUxdjdQM01jVldVdVBKUWkxZGN0bXVrUE53RWhxZnAzU3JjVWorREVj?=
	=?utf-8?B?QjB6UFBKeEE0NmM3dXZ5STRZS1lsR0FheUVoU3hmcURZNzdtZ3FNUzVOa09U?=
	=?utf-8?B?SmZpQnVvYnpveXc5WCtrVndGT3JoMWtDTkVxRGt4aEhURXVJZkl3Qnk5Wkww?=
	=?utf-8?B?R1ZiQ1dlTWhZZ3dxVzc1enVPUVdhN1I1ZTBXV0J4WjEzNjJYSXcveUlUUkpi?=
	=?utf-8?B?MElrR0FUb01lWEk0eU1LVVpSWEIxZ0RqZnhjSG1pSE1MaGNxZUFqNGtZaU04?=
	=?utf-8?B?TXh6U3ZxeGFJb3oxSVh3bUpHQ0tDMEgyOGYycjQwUmFBeHllZlhFbi8wTlB1?=
	=?utf-8?B?YWZqVEh2YUV2aCs2dTFaZ0dpNzlEd1hoU2owbzk5RzZUVEFQQVRjay8vcFds?=
	=?utf-8?B?T3YxZFo4V3RxYm5YckVhc1NUMnNMVWg2ZWdhNCtGNHFUM0twOUpYVjQ1czVs?=
	=?utf-8?B?SHFVYVF0K2R1QXFYTUROL3dodlZkRFVlWFRoZkV4djhTQ0JWbWJONWVoaUQ5?=
	=?utf-8?B?OTY0ZWpRbUpPTGxuc2dtbEIrUHNQaWlyemREYW5YRk5xcHNwUnFFVnB5dll2?=
	=?utf-8?B?SHZpeWdvK2ZjRWhUYXVKRW4xd21PNm9FeldndFdkNjF6cm1rYW8rdklNRnhZ?=
	=?utf-8?B?Qmg3S1NvRmw1S1lFbnZjdlgyMjZJMG1vZ3BxSndCdHFwT2l0dG56VzBPL3Yr?=
	=?utf-8?B?cnMwOHByWUxXSFlRbW5pQWszT01BWEE0ck81dE9keEJseWdtTzk4d1lMUFhq?=
	=?utf-8?B?KzV6SkhpSC9OYjdIOEVvQythK1BtQ3dOYUZXRE9GbTY0aEs3aG9oTGFQckh3?=
	=?utf-8?B?c21oamdBb3c4WExyZkk5RDBvUFQ3Smt6U2xmMkpJVGdxMjJ6dXlRdkNjWW5h?=
	=?utf-8?B?SGlhR0c2RUtKVkVFTEtNSGVDRW5QNHBZK3A2bThVT1ZkMTFQVXhjVXhzZVoy?=
	=?utf-8?B?Q0FaaThhTGdDTHFucnpWL0F2VktNU3NpbU84ekhLZ1hTYjRMY2lpeUhFRzZT?=
	=?utf-8?B?T2w2VXJPR3pWQWN2Y05XdTVpNW9UT25ValRRRkRlb1J0eGdqQ0toaUNSRW5y?=
	=?utf-8?B?OGJwcmFiS25uYngzMExsSnpFR21Xd3JPaHBVWUc4SVQ3cTRXNENibjBZR2xR?=
	=?utf-8?B?WGU0RUNoVzI2T2Z5Z1FEazJ1aGszcFduWlNRK3BPWk9yM0NrQXZvK25PN0k4?=
	=?utf-8?B?V1BvWmwza05DZU5KSVlsZGZSVHNaKzlwdkZYR3ROV0w4cUFhMVdEM0ppdFBP?=
	=?utf-8?Q?MgE34z1QxhDc17qaQeD7hFe3v/GLY+1Clt1fh3E?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68d0ffea-8f13-4648-9b39-08d97dabf6f7
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 09:32:58.7963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0hD0M/N5FDYuFG/CWhQi59nYta/GpesETUbGcCDJgPA06beSiOodcOF6des5rHwwEusy4BZHCUL4JjkyvZINCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6090
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/21/21 9:54 PM, David Teigland wrote:
> On Tue, Sep 21, 2021 at 02:38:45PM +0800, heming.zhao@suse.com wrote:
>> But I am ok with the reload_config idea, it's more basic.
>> We could give dlm_controld a chance to change behavior on the fly.
>> If needed, I could file a new patch for feature "reload_config", can I do it?
> 
> Yes, I'd welcome a patch adding a dlm_tool reload_config option to reread
> dlm.conf and apply new settings from it.
> Thanks,
> Dave
> 

Before sending the new feature patch, I want to have more discussion.

In my opinion, changing and reloading dlm.conf is a ***heavy*** way to update
dlm_controld settings. This manner is well suited for the change of a setting
still valid to next turn startup dlm_controld.
There are some use cases which require a ***light*** way to update settings.
It just needs updating settings in memory and validating in a short time
(or until one dlm_controld running turn).

Examples:

1. debug

debugging the code temporarily with no intention to change dlm.conf.

2. to get some log

temporarily enable dlm log for checking status.

3. temporarily change dlm_controld behaviour

(there is a production use case.)
a. In 3+ nodes HA cluster env, dlm_controld startup with default settings.
b. after stopping 2 of 3 nodes in cluster. (by cmd "crm cluster stop")
c. the only left node is lacking quorum and quorate become "NO". (by cmd "corosync-quorumtool")
d. on the last active node, run "crm cluster stop" to stop this node.
    the result is the node will be hung and will be fenced for a short while by trigging timeout.

The hanging in <d> can be avoid by temporarily changing settings:
enable_quorum_fencing and enable_quorum_lockspace from default value 1 to 0.
and the changing does not need lasting for node restart.

So,
If there is no chance to add dynamic updating setting by run command.
Is it a good idea to add a parameter "-I", like "dlm_tool -I reload_config".
"-I" means directly change without reading from dlm.conf.
When users want to restore the original setting, run "dlm_tool reload_config"
(without "-I") to override with predefined/default values.

Thanks
Heming

