Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC224C52BE
	for <lists+cluster-devel@lfdr.de>; Sat, 26 Feb 2022 01:41:43 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-5WIvRD2pOyW6LbD2SSWW_Q-1; Fri, 25 Feb 2022 19:41:39 -0500
X-MC-Unique: 5WIvRD2pOyW6LbD2SSWW_Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3884A180FD71;
	Sat, 26 Feb 2022 00:41:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 83B1994C11;
	Sat, 26 Feb 2022 00:41:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 05D1C1809C98;
	Sat, 26 Feb 2022 00:41:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21Q0fPFY032759 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 25 Feb 2022 19:41:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A9BB840CFD01; Sat, 26 Feb 2022 00:41:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A395E40CFD18
	for <cluster-devel@redhat.com>; Sat, 26 Feb 2022 00:41:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 877CE805A30
	for <cluster-devel@redhat.com>; Sat, 26 Feb 2022 00:41:25 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam08on2064.outbound.protection.outlook.com [40.107.102.64])
	by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-145--WlfT1s9NtOR_pYQj4QOGQ-1; Fri, 25 Feb 2022 19:41:21 -0500
X-MC-Unique: -WlfT1s9NtOR_pYQj4QOGQ-1
Received: from BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16)
	by DM6PR12MB4714.namprd12.prod.outlook.com (2603:10b6:5:30::14) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21;
	Sat, 26 Feb 2022 00:41:19 +0000
Received: from BY5PR12MB4130.namprd12.prod.outlook.com
	([fe80::498:6469:148a:49c7]) by BY5PR12MB4130.namprd12.prod.outlook.com
	([fe80::498:6469:148a:49c7%7]) with mapi id 15.20.5017.026;
	Sat, 26 Feb 2022 00:41:19 +0000
Message-ID: <303059e6-3a33-99cb-2952-82fe8079fa45@nvidia.com>
Date: Fri, 25 Feb 2022 16:41:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.6.1
To: "Theodore Ts'o" <tytso@mit.edu>
References: <Yg0m6IjcNmfaSokM@google.com> <Yhks88tO3Em/G370@mit.edu>
	<YhlBUCi9O30szf6l@sol.localdomain> <YhlFRoJ3OdYMIh44@mit.edu>
	<YhlIvw00Y4MkAgxX@mit.edu>
	<2f9933b3-a574-23e1-e632-72fc29e582cf@nvidia.com>
	<YhlkcYjozFmt3Kl4@mit.edu>
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <YhlkcYjozFmt3Kl4@mit.edu>
X-ClientProxiedBy: SJ0PR03CA0263.namprd03.prod.outlook.com
	(2603:10b6:a03:3a0::28) To BY5PR12MB4130.namprd12.prod.outlook.com
	(2603:10b6:a03:20b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6db02009-d568-42b9-5da5-08d9f8c0b418
X-MS-TrafficTypeDiagnostic: DM6PR12MB4714:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB47143308C925ACEB267D2A91A83F9@DM6PR12MB4714.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: ohfcDu30HRSHdOJkahnxc4HH+jUcMkHrurpyUhB8LHSGM7JVM43kXHWGU0874IOh+4d1gRp75l1jOHIzv+98p+AgQPKoQ4GgWM93ltJKWmQ8AKpNMbTJYzNpruAqv19zjO9hH7dWOm7TfQ79xQ5dtt0m41TLJU0NRxMOtgj0z8qckAHmbkkeREJTaMhR1cPz83nCWBOmubq/22SZzD2Ti6Srm64vc1HkJ6epPIDz4/6oyAxTR0uLyBtZe6gO1pC/i7bgSn2pyPOe1DxY/aAwWXBnm2zkn4j/e8vSf39Q6wyIIG371ymxOrFQF+odVrUtxAFchmnPzUwIPsaWBkOiNMG7XjCmXGF+IhN03aIeQfgfs9nlEST1Iw5shEAVbmtn18dA1Z2P6Z1wBd3Zr11DyIdALpDCrNVs1yWkOd0Jnd+kc2veLl2DYFCueBlgNiPHDO2prGeyS6RJhf+UQuXjJgazDYTGOSbABLOzSZli92qNVHfoJ7Oya3PYpsldSOZ2Lb03hGiBHfWOIfjq3DSueg9itkp7YxhPphl5+hcnCH8qlgi1pSwRcFggzliPcSXo1yvJpFaDDss4MTrGyWLffMHkRjhcse2Qlksm2xzBK5b5F+sdkIn3QXjtDvT7u9b/luP5/7PxxXBnRKv3Or1tmSQ0akQdtpTJrxOJoKmIr7eQ5IojQw3ouR091+hdiSolzp5UhwtDZYWD/li5lxlT1hebwMgxxl7gyEFwTOI7i1BUU0fCi3s9glGLRsxpmxvTcnuPnkVdmwt0Ybnjbd9m+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR12MB4130.namprd12.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(13230001)(4636009)(366004)(6512007)(66556008)(31696002)(508600001)(38100700002)(66946007)(83380400001)(6486002)(6666004)(36756003)(53546011)(8936002)(31686004)(2616005)(316002)(6506007)(86362001)(26005)(6916009)(66476007)(2906002)(8676002)(4326008)(7416002)(186003)(54906003)(5660300002)(14143004)(43740500002)(45980500001);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXY1bkRIeUFWeVZaa0VVbWZucHhLa2k0aFJaSG5ITjUxb2dhaHNXbVZiazk1?=
	=?utf-8?B?OC9LbnZqWFZ5TXdLSk51eERveFlObkc5eGlxbGR0NnVRNnNEaUFwL1NiTnNM?=
	=?utf-8?B?NGU2MS9oUVptSGJYOU15d3ZUOGxoVDVVZml5MCtrMnhCYzRKZlBnT2cxZWN1?=
	=?utf-8?B?cjlzYUZlNmwvWkRLTUlFNWhXVWVhMGIwQ1VSeFZWUzhzL1BvWWIrMWIyRnVU?=
	=?utf-8?B?ZXUvdXJ2ZU9SZTczcGJGM1lTV2xLcy9Fd3VoNXNPY1RXdDExL0hDanc0cGhJ?=
	=?utf-8?B?VlFMQVl5Yno0S2VjUUtlS2NZZzZES2RvS2hxcXFuaUJtVEFGNW9SVFgrNU80?=
	=?utf-8?B?Tno2ZmhnV2J1UTNYd3JIcERua3VvbjZORXJOSGtFVm5zL3ZURDdqVmFxYXFu?=
	=?utf-8?B?dGdNdU1OTlZpQmgvckpGSG1sTXdsOFVsWkVrdncxSXNUQXU5eEIra1JHd3hQ?=
	=?utf-8?B?bEl2bkV2c3RKQm1kY2JZL0ZnWTlpbTQwVVpWUTg1K3hjRVE4Q3JlZmRJdXhI?=
	=?utf-8?B?OXVRUUZNZjVtSjgrVzFEN0lzQVJmcktqdlhaM3BBclo1TURrR2g1YUJESzB4?=
	=?utf-8?B?bEduNE1oUmxzR0dPVTc2dUE1di8vNVlFK0ttckVhdjcyaHFrVnp3and0U2hX?=
	=?utf-8?B?VzJUbW94eVpDSFRWMWVWNUhvNVVpdWZ6UWdJR05TMGg0OUc4MWIzdmZjVHkw?=
	=?utf-8?B?dVlsbCt0VHRqdTJDVWpTVVFkUmNMTVQzeXBBWWJSWlRFQXVHcVBBZmZWMU92?=
	=?utf-8?B?UEF4TnBSRERTbFM4NTBiZFIrc0VTbXRiWEtOYVkvWERHMzE5MzJkZ2hJVHFR?=
	=?utf-8?B?bkdLWUxiVXJaWnJOQVdHMDFBUWh1bjRoa2dkbGxpb3QyMFFWaFd6YnAyRmlw?=
	=?utf-8?B?UEptMi9xRVhIbUwvUFRZOUd0TEo3allSUGpuSVEvWUtURE1DRnNZMkNXNEQ0?=
	=?utf-8?B?cGtlam95RGFCUFNQTlpLVzk1MzJmdkNlU1ptRVZHZnk3anRnb0hDNGRDZ3JB?=
	=?utf-8?B?Y3FiMTNBSVpRQ3RCR0hvMm0zMHlFR2FIVW9oalBUL3REUjg5U3R6enY3dlZr?=
	=?utf-8?B?bFA0dUpHc0ZCSnU5b1ltRUpIN3I3QlRVTXFEQ2RPY2ZMdFpWenJ1NU5DVVoy?=
	=?utf-8?B?ZVFUZFQ3eXNZV2pjZlZFMm1IWndBa2N0YjAxT2VORVhVeCtDYzRWbEg0MmJI?=
	=?utf-8?B?VXNseFZPUEM5dUNKMFRaTFRySlF5R3MxbXlJQnArK3hLWktFQ21uQThrYVdS?=
	=?utf-8?B?amZhVUg1VmNjV3ZSNEdnOVpmVCt5alNrc3I0NFk1TXlxQWtoc2hrclhvRzE3?=
	=?utf-8?B?U1ROd2NablkzRnoyL0txeUtLME85YXlnbzJ0MlpsVngyMjlUSENmL2VIaGVi?=
	=?utf-8?B?M2FwTnRNcFhCb04rT2hIWEs5cmsxdEE3YWwvd1JhVEc0TEwzeUhGV2hRRGRI?=
	=?utf-8?B?cU9mbzgzaVk5aCtsR1JjVWwzc2VhbCtUNlZBY2dqQU1GaVhoeUNJUkxibFNF?=
	=?utf-8?B?cDUvU1JkK21oY1Z0WE8yQnIxNUE2eFRrM0JzNnhBT2lycHJZTHAzKzJNVlhE?=
	=?utf-8?B?aUgwT21YQy9vY2FhaEdLQVlTTUVOOEQ4cU4yVjNxTnIxZXpMUXRMSFJKdGg1?=
	=?utf-8?B?WXJjZWIxc0Z2azNRZHFqdjNpZUFaakovL01GLytGOS9DdWMvTnN3YWMzL1Jl?=
	=?utf-8?B?NmRkY3hKeDh2L0hFZGFNMlJERXNzUGxlVEpJVkc0NTNyNmw5bnQzYW1EcWNG?=
	=?utf-8?B?R2VEWEFuNk9VS1VxYUIwT0UyWkRMOG1ySno0cU1YOWU2V1NpTkZCbTdhUG9I?=
	=?utf-8?B?WFZoVFlwNUNkMUxMY1U3Y01MV2tvUVF3djc1SkY3UnVKZm1meThXNWRKdFVh?=
	=?utf-8?B?bklhci9IZFhkenZHazJsUHJLdmlDakpzV1c5Vm1kVnNLaGVTOHd2MjRNYWNu?=
	=?utf-8?B?VHdzelBKNTlBL3VoSHU1NDBVSlc0UEk1SWtTZEFNbC9nalg3aWU4SFN0Tkp0?=
	=?utf-8?B?L2Q2ejNyYUZ1YTdvVHBkbmU4bzd4a3VOai9MK2htaldhZ2kraHVDY0FYVnNM?=
	=?utf-8?B?R0YxQXhNWllRa2dRMlpJSVdETjJKVlpqcGJ3cjVTY0lJTW5JdkRYYXVQWVNZ?=
	=?utf-8?B?dTNBenkxR0NEN3k1SEZPYjBRWXg2anBPUGovYnZWZ0t5SlpxUTlmUHBuS3hO?=
	=?utf-8?Q?Bx+09a0dJD9cIRpqkY4loEY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6db02009-d568-42b9-5da5-08d9f8c0b418
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2022 00:41:19.0586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tgtP3IfZKZxkok33P5zyFbNNLnFSM0ygzmoVshlsxRevM3hujjNyAFRpCsHoFDF2gNwB8jSSRCixCkb0aydVqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4714
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
	Johannes Thumshirn <jth@kernel.org>,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
	Eric Biggers <ebiggers@kernel.org>, linux-fsdevel@vger.kernel.org,
	Ritesh Harjani <riteshh@linux.ibm.com>,
	linux-ext4@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
	Christoph Hellwig <hch@lst.de>, Goldwyn Rodrigues <rgoldwyn@suse.com>
Subject: Re: [Cluster-devel] [PATCH -v3] ext4: don't BUG if kernel
 subsystems dirty pages without asking ext4 first
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/25/22 15:21, Theodore Ts'o wrote:
...
> For process_vm_writev() this is a case where user pages are pinned and
> then released in short order, so I suspect that race with the page
> cleaner would also be very hard to hit.  But we could completely
> remove the potential for the race, and also make things kinder for

Completely removing the race would be wonderful. Because large
supercomputer installations are good at hitting "rare" cases.


> f2fs and btrfs's compressed file write support, by making things work
> much like the write(2) system call.  Imagine if we had a
> "pin_user_pages_local()" which calls write_begin(), and a
> "unpin_user_pages_local()" which calls write_end(), and the

Right, that would supply the missing connection to the filesystems.

In fact, maybe these names about right:

     pin_user_file_pages()
     unpin_user_file_pages()

...and then put them in a filesystem header file, because these are now
tightly coupled to filesystems, what with the need to call
.write_begin() and .write_end().

OK...

> presumption with the "[un]pin_user_pages_local" API is that you don't
> hold the pinned pages for very long --- say, not across a system call
> boundary, and then it would work the same way the write(2) system call
> works does except that in the case of process_vm_writev(2) the pages
> are identified by another process's address space where they happen to
> be mapped.
> 
> This obviously doesn't work when pinning pages for remote DMA, because
> in that case the time between pin_user_pages_remote() and
> unpin_user_pages_remote() could be a long, long time, so that means we
> can't use using write_begin/write_end; we'd need to call page_mkwrite()
> when the pages are first pinned and then somehow prevent the page
> cleaner from touching a dirty page which is pinned for use by the
> remote DMA.
> 
> Does that make sense?
> 
> 							- Ted

Yes, I really like this suggestion. It would neatly solve most short
term pinning cases, without interfering with any future solutions for
the long term pinning cases. Very nice.


thanks,
-- 
John Hubbard
NVIDIA

