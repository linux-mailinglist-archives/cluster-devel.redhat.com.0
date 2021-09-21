Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id AA6BF412EB1
	for <lists+cluster-devel@lfdr.de>; Tue, 21 Sep 2021 08:39:24 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-kW7HuxqAOkuZ0oAlGjgt5w-1; Tue, 21 Sep 2021 02:39:22 -0400
X-MC-Unique: kW7HuxqAOkuZ0oAlGjgt5w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27450802921;
	Tue, 21 Sep 2021 06:39:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F32A25C3DF;
	Tue, 21 Sep 2021 06:39:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D7C47180598A;
	Tue, 21 Sep 2021 06:39:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18L6dCw3025857 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 21 Sep 2021 02:39:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 77D87200E1F7; Tue, 21 Sep 2021 06:39:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EEAF2031A2D
	for <cluster-devel@redhat.com>; Tue, 21 Sep 2021 06:38:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5ACE2800B24
	for <cluster-devel@redhat.com>; Tue, 21 Sep 2021 06:38:59 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-367-PrWVVFpNM_aZKQ3TbSEOsw-1;
	Tue, 21 Sep 2021 02:38:57 -0400
X-MC-Unique: PrWVVFpNM_aZKQ3TbSEOsw-1
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
	(mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-12-co7VcbJZM-Sftn2oWXHjzw-1; Tue, 21 Sep 2021 08:38:55 +0200
X-MC-Unique: co7VcbJZM-Sftn2oWXHjzw-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DBBPR04MB7786.eurprd04.prod.outlook.com (2603:10a6:10:1e8::14) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4523.16; Tue, 21 Sep 2021 06:38:53 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d]) by DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d%6]) with mapi id 15.20.4523.018;
	Tue, 21 Sep 2021 06:38:53 +0000
To: David Teigland <teigland@redhat.com>
References: <20210919064322.1670-1-heming.zhao@suse.com>
	<20210920175736.GA19901@redhat.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <d8d58ce5-6a38-9b76-8b9c-8e52e8760681@suse.com>
Date: Tue, 21 Sep 2021 14:38:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.14.0
In-Reply-To: <20210920175736.GA19901@redhat.com>
X-ClientProxiedBy: HK2PR02CA0168.apcprd02.prod.outlook.com
	(2603:1096:201:1f::28) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from c73.home (123.123.135.9) by
	HK2PR02CA0168.apcprd02.prod.outlook.com (2603:1096:201:1f::28)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14
	via Frontend Transport; Tue, 21 Sep 2021 06:38:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 345036de-ef68-44bb-f076-08d97cca7a72
X-MS-TrafficTypeDiagnostic: DBBPR04MB7786:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB7786F2177B962969CE7A2FCC97A19@DBBPR04MB7786.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: 1Fy8R/raOGGmLy6PJFEdwRsv8+nXqL04FP0Kqhh3RlVQVb5Du19qBbTveqFE11qNtupFery8pb5Kya3qnlDU76cje9GaBozDl6YT7MW6gSLPdMQVLdFOIvwp98ibjA+5E91Ugfhw5500HeCDvk1V7H/CtOmpILh3sJwr+OR2sncSkgZ53MIAHM6RgZpYWhnkczpVhWMHzffPwQi8GcF/Mf3nCPP6RdiupypexPzjVr0C1EXLJVUHPugeS6HF0rOZW4wKkd4+cvgnuZ2RR78TYAfwpL3iJXHKtJxYaUbssAKKUBZMkqYPO38cWV215i+kXUiRagifcnUqkwfuy22gwMFXLikhIyqle/EnwnhlykPV6H89MFwdNjTyh2jkLD9J+0T+9Ywa+creE7tWUPIZR9L/vUdUFeZzBQjWsNQQmGzGi/lkMm/wffCk+khnjrxU1nnJDrAsz6PYaBDWqybWpYSQUmyRPoFnXQXhkhcMGToUY7KTJqAUFZv0zlQLMLpN5q12jcZSv6gEshyBOIaAsjN3tfNDl/m5LttXeknJV/HPvc5jPZ8pCulX62dqEeTbCeZzEzeoGulo7DraAsMY3L49mCHMfsfwT947h0tvx7qTnyEhdohAWYCnFd3DxkG3c2mpKUfa6OlQojOTR8L7LWceWMZM0asb+Yo5L+909qrW4RO96ealASkP/TjqPsIpz+fBJDT8TABfwbs6Zy+l3iIGjPkNrJ39CiuJRahTYb99fKQL7faB4JkpYACAZ0eO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(2616005)(956004)(86362001)(5660300002)(66476007)(186003)(107886003)(31686004)(6666004)(53546011)(6506007)(26005)(31696002)(6512007)(38100700002)(66556008)(66946007)(8676002)(36756003)(6916009)(8886007)(450100002)(6486002)(508600001)(316002)(4326008)(2906002)(8936002)(9126006)(45980500001)(43740500002);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTJ6QjMrbVg2aW9kVWozMUd4M1FMaUZQZXppUUZzbDlDRnBaZENLMFF5QkY2?=
	=?utf-8?B?eUI2MUtWNFBTREE5KzBrNUIzTmMwelhBbWdUMkcxa0tSbXJzanNyOHg2alpJ?=
	=?utf-8?B?dDIwamIrdTdiRE1OaGM4M2hzcjV3NHNMSUFkVjRjU2dPeDlTWWtkSm5yNUcr?=
	=?utf-8?B?WFcrRG1zazdQUkFQT2VrWEIyNnpmK0VIMm5vT1RvOHd6ZHZxT3lmTDE0VktI?=
	=?utf-8?B?bWduaG5tbFRsR1o4cTFmSEs3KzhsSm5teStVNzF2VytLQ012V3JFZDlGV1BN?=
	=?utf-8?B?MFBBTjRnOWNNeHR5aVJUTFJoemZOUTZSMHlUTGV0akgxMURTQW9OQUNGS3VS?=
	=?utf-8?B?cDdTcE11ak9Ec3JWUmIrSlg3OGVIWGlYUHdDZ1BxMGg4enArOHRlekZFS1JQ?=
	=?utf-8?B?Q0FRUkVwdmJwaDRmdEVUZk9kYS9YcTJwVE5VeWJSUDhFeGR2VDdPMHZsQnFG?=
	=?utf-8?B?MHRZMUhPeUJIbTBGb1RZQk9TdTZRUDB3Z29tRzVnNUYyWXdqd0N4OGVsbXJT?=
	=?utf-8?B?bUt1S3Jvc2VieUpaMnhKYWNxNG5SUUltVHk1ZXI4enZlVjZnNzAvZUxLSlVV?=
	=?utf-8?B?eE1LaGRiVForR1JHQ2FndFJnNGFIWHVKYUxYeTBsSVg2QldqTkMzOUNLdXNl?=
	=?utf-8?B?cUlIOThXWlNkR080SjRpbGpvckYwbmN6VTRFSThUeVlSVGVYQ0FWOXRYNkhC?=
	=?utf-8?B?M2UvSm1aWnV0RG1WWTlXYnB2NGhaUjMvN0V5LzVvRmFYcEYrR2NPNXg5ajVr?=
	=?utf-8?B?NmFic08xamwzY1lWeWVBaFJIRy9jNzdTVEhraVBGSXZCSUk2L0ZHd1ZRWWdS?=
	=?utf-8?B?NlJDZWRGR3c5UE5Wd0pUNmlSSXpVZVRVVHNRVFVoalBpdHNiMkVNK1B3Qno0?=
	=?utf-8?B?aUgxL2c4WXpHV1BPU1YyRjNMazduaTNRQkZUVWhFL0o2YmVxOE5kY1Y5RlY3?=
	=?utf-8?B?VkZXbG1pN2w1U01CNjNVaGkvNVU3NXF2dk5ycDlEditaRm1oK0ZyMlNRZlIy?=
	=?utf-8?B?Rk5EQmhsS2ZuUjJId0JjRWNxR3BVcEd6SzhZdFRDbWp6TVc3Q1c1MytJUWNW?=
	=?utf-8?B?WE1ueVVDd0RtK3FPVnRXejE0WkJNRDAyQlduOVVLR0tHZ2F6eGdpUHZPSUtJ?=
	=?utf-8?B?aDF4ZmtnQk1EVDR4WW9IeXlza2tjTkJkOTVSRTA0N0ZCYTBMWFVKbVc4b1BH?=
	=?utf-8?B?Nml5SENDVWZUUmxsalRXblloNUhVbXlZQVBXTDBSWUYyWFBEa2RLY1hqREIz?=
	=?utf-8?B?UVIzWDZWV01paWRKQTl6bnY1UVEySDRua3d6TFh6VE9TZWZ5MElXK28zT0FH?=
	=?utf-8?B?QnlWUjhKNExTeThueUw3UmxTOXd6dk9oSE5vYk4xNXRTNHBlUDBjMjFyMEpM?=
	=?utf-8?B?Y3EzbENUcUUrZjdTemN0NWorQms3N3lkaXJZR2U1c2dRQUx4MUtTdHV0STlT?=
	=?utf-8?B?aFhjb2dPYWh3Mm9NQ0pQQk85VmJyaFF0MTNnSzg3NHdMV3JIMkVpRFkxTHdP?=
	=?utf-8?B?Qm15eC8va29IdERzakZ0UEV5VkxROW1GbjNhTzR1aURNclZQa252UXgwK0sv?=
	=?utf-8?B?MkltTno4cHhDQmZTc0ZaV1ErUFlIOTNsN0Eybng0WWNMeXpGR2IxVStnQzYy?=
	=?utf-8?B?ZGEvejJqV3BGa1lrTGtBaHFmZDIxMWM0K1lqb3BSWWl5WlcyNk9EdHVGK0ZM?=
	=?utf-8?B?Z1BvT3ZxOU5RQi9raWtWODhBZFIxUThVaHdKRnpBcldocnlBSXcvWE94amFW?=
	=?utf-8?Q?tzbd1zm4gA2DxXBm83IeNYL0Ao1UGwDJHc8qqT8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 345036de-ef68-44bb-f076-08d97cca7a72
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 06:38:53.2635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p633tzO+6k0Ynie3GxzXQki6mgXz56UxR2ZlV1ATSQE7NM83sljyODDKhU6PA3qWQHX2ssmJWGOKgj7onunlUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7786
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

On 9/21/21 1:57 AM, David Teigland wrote:
> On Sun, Sep 19, 2021 at 02:43:12PM +0800, Heming Zhao wrote:
>> This new feature gives dlm ability to change config settings dynamically.
> 
> Hi Heming,
> 
> Letting dlm_controld reload certain settings from dlm.conf makes sense,
> but I'd like something more basic.  Let the user edit dlm.conf, then
> run dlm_tool reload_config to tell dlm_controld to reread dlm.conf, and
> apply new settings.  This doesn't involve remote nodes, it's all local.
> If the user wants, they can make changes on other nodes the same way.
> 
> (We don't need to touch the "run" extension, which I'd like to remove
> some day since it doesn't really belong in the dlm.)
> 

Hello Dave,

Thank you for your comment.

One of the reasons for my patch based on run command is user could send
command to all nodes by only one-line command.
Dynamic settings (my patch) requires user the least time/work to change
dlm_controld behaviors. If not, it needs to separately edit dlm.conf &
run reload cmd on every local node.

But I am ok with the reload_config idea, it's more basic.
We could give dlm_controld a chance to change behavior on the fly.
If needed, I could file a new patch for feature "reload_config", can I do it?

Heming

