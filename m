Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 27D2A3D7283
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Jul 2021 12:03:51 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-Z45_Z6PqMVadfZhsQfo_qQ-1; Tue, 27 Jul 2021 06:03:49 -0400
X-MC-Unique: Z45_Z6PqMVadfZhsQfo_qQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEBDCCC659;
	Tue, 27 Jul 2021 10:03:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D286104813A;
	Tue, 27 Jul 2021 10:03:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B998C4BB7C;
	Tue, 27 Jul 2021 10:03:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16R9qOcE001385 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 27 Jul 2021 05:52:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0844E10F1CBD; Tue, 27 Jul 2021 09:52:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 026E810F1CA1
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 09:52:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E58F802A5E
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 09:52:20 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
	[205.220.177.32]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-493-W-rCYwh5M9qPngx_8UzueA-1; Tue, 27 Jul 2021 05:52:17 -0400
X-MC-Unique: W-rCYwh5M9qPngx_8UzueA-1
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
	16R9qCQF009826; Tue, 27 Jul 2021 09:52:12 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by mx0b-00069f02.pphosted.com with ESMTP id 3a235dsbaf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Jul 2021 09:52:12 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	16R9pfTb025630; Tue, 27 Jul 2021 09:52:08 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
	(mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by aserp3030.oracle.com with ESMTP id 3a234a454u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Jul 2021 09:52:08 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
	(2603:10b6:301:2d::28) by MWHPR1001MB2093.namprd10.prod.outlook.com
	(2603:10b6:301:36::34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26;
	Tue, 27 Jul 2021 09:52:06 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
	([fe80::5820:e42b:73d7:4268]) by
	MWHPR1001MB2365.namprd10.prod.outlook.com
	([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4352.031;
	Tue, 27 Jul 2021 09:52:06 +0000
Date: Tue, 27 Jul 2021 12:51:48 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild@lists.01.org, Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <202107270528.U5UdYp9I-lkp@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0040.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::17)
	To MWHPR1001MB2365.namprd10.prod.outlook.com
	(2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by
	JNAP275CA0040.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::17)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29
	via Frontend Transport; Tue, 27 Jul 2021 09:52:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c45f78bc-cec9-4714-d87a-08d950e4316c
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2093:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB20934FB435AAB59F5E7532CF8EE99@MWHPR1001MB2093.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: UFHhIJZqNqvZaA89atXiaQbRhAFXwgeFPlm3teUZlusKQsbKg3xsi3zLhW7+VnE+Sg+Nco+9pfdbtO2sEqLyuFeedXdRU4R4eIRpzfHxZUYWCKr75vnUUu70k6pEF1T7ernemVzgaORIX3lMeDSD8/bCLMpWLcuLJEwpkmMNMkGrZzN1VJbORTFTfd9tVchSX8yLLV4AgcOftnXxaKjmpEEwWAJoyE3j/M5W9jzI/c9vfVRJdzivLKqX4gQF2TyUvF1/K97L7+GeO0P5Pbd7KgJO8fibdx8ImEud+noyGVQZS0FmvHtSUQXi2wPtGCtWLKHQytBpqUJhoIU+XJ/ncKlZLbapMRxxgkeIj+V3s5PwdYeLfuioWl5cvZB8yft912Bf4RZo6n0cQR8BdaaE/Htt6F9yx9He2yr1LMLiA6tpKObX8zKfN03Opmj2DugwA4cr8QCaABZMdWaaPk8m5D6GSQoQlfwd6/u+6IZ2aAjeCK2jHEuXXgUJYg9bidp5QJcrqGifZU1tX6YgLCxPlHIdPCm+kAKRa6lHfGfnTwT2H6A+xlQ17yWknCyshkJuNCbbxx6P8mDBtKFhRtLteSgGFHKKihWF3oJp6nPWJl3S1CTK5yTQ7JDXjNionfBVjy0onEne3JLHRnYLINZC/1y0tTtv7bRPFWduj5XedpSo2Va2LTNbX9RzzsCsE8zuDmpkB/EBW+saKGyELUuXQplZn6iJ1z/6Ax5bUTP5F1y4i8yy4cJ0vBrsAdei6OWbANMTtZgMWVyfYF7WMTw1L26/T5kiV/l7ICMDfqu1N+7xH7dUUb/D0PgoVABXS5IiFqJTFPoLtBj0p6aVjtbFJw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(396003)(346002)(366004)(136003)(39860400002)(376002)(83380400001)(36756003)(44832011)(5660300002)(2906002)(52116002)(6666004)(6496006)(6916009)(38350700002)(186003)(38100700002)(1076003)(26005)(966005)(8676002)(4326008)(9686003)(8936002)(66946007)(6486002)(66476007)(316002)(66556008)(956004)(478600001)(86362001);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A2+/EvFhBUskdMAUz9b2h9jBbPqnb8EAolOxvRomqzVBC1fFcvBCzurGfjrZ?=
	=?us-ascii?Q?fP4y6Vlb4XC1dkh//RuAkDe7Pku+DhXuMjAbb/L15puzYN8f3zPBHPb/74TT?=
	=?us-ascii?Q?MTf+J5CbY1pGhbTPFtgV4s3FiI/KWcdmSki6F+sjwD5aD2Ctn5PK4q5LUxC/?=
	=?us-ascii?Q?G86yPzITLnPbk3JWKWxdTTeNjbTYqpQBcvVm4P3YYiHeCP6E0lbkhEcEM/Rd?=
	=?us-ascii?Q?QmzMvpBp2ioKX5Unt8sXkqaVSx2Imit/da1LeAJeAOIzKFCi9Wdcp7UMsQks?=
	=?us-ascii?Q?jbpV0ti6GUxylAcvNz3p+fOmkQgJgpjdN+i0sxlY0o4T6mB36F2CrygnRZnG?=
	=?us-ascii?Q?e2jmu6lPPBmWz7cGLBUBhXKkLJ5w9Z54BOAygKD1gj6vjSYYFWd75NIOeIxY?=
	=?us-ascii?Q?AdC0Z+0D1f1qqRTO/rFDWTQM0181tWNP871VkIrt2bND7yQVCwdxo7NDvm5o?=
	=?us-ascii?Q?8iXpsCA/ACq+dOGrrHocE8unVMce+LNOqtjUk/CoMdY1akSi1Yh2JaUcQ8+U?=
	=?us-ascii?Q?AUuRfUGCMdAve3THZsIss4asl7iMxclKA5vR3OcLW4jsPjWWxi9f3Fb3EBUF?=
	=?us-ascii?Q?h83HpZjJSrlOO1zT9SLhVKD4oQroSuPHZwnHLt2hK3I3QbGW4K2mRCvW2Pmc?=
	=?us-ascii?Q?O8lPG+tZ2Tm3+L9vWm3NLAlMGVO/D5ZYADZwwIUWVPuapXmAE5lhpfc+xGh0?=
	=?us-ascii?Q?wXCsRvx3lnXoCMfNdwOcq6CizCQrYICWskOxNSif118PBBQR8RdTYHzNfcEF?=
	=?us-ascii?Q?oWLMVmdASlacvithGJngNWzK4Vddl3XHPBqeWDdlTm91C9qwIj8WqKRyaSnE?=
	=?us-ascii?Q?yG0YVFatyeC/YwRE6kAscd18iYr00dwM/1O+X67Vsd6PBsqo6vJjxPqxcRu7?=
	=?us-ascii?Q?KMyzWAos0BP73H8pbbPtSloSj56IYD9RlXhT2khBgQvtsIipcVodE6MyG5IT?=
	=?us-ascii?Q?Mu7OMxZ6AjHMMHTfEemRIu9Wk6ai3FH/YKobxFOtmD32YAURAuXEPvSrAZ2e?=
	=?us-ascii?Q?mOvLL9tWKGkpFsIR0O/PPjWpRxhc+5CTjVX58OQ4nBzfppERQW7jCXL1tEI9?=
	=?us-ascii?Q?GoFnsabYDkVWXQMCEFDYA0ljlAZvTLxtaOfyu8fzO0fo86BlsQA/sW6p6llv?=
	=?us-ascii?Q?wQbZBg8dOWgC4XEQ1H1CR/gNdebJzl86vZBgmeGmccpShp/5hzqUaiA1QqRZ?=
	=?us-ascii?Q?7L4us5fqBH8z6aSV3xi55RNvHgNSs3fdZdt3XaQljI/D08EFtxNuwJd6C9vB?=
	=?us-ascii?Q?9XRSwgw9UvUUhdSn89z/5NQz1YXad0Y/VJQ3UZhKKz7vQ9A5FGueIWt+nKYT?=
	=?us-ascii?Q?Je38VMVUgLpGTmwosHU2oIN4?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c45f78bc-cec9-4714-d87a-08d950e4316c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 09:52:06.2977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 30iI+u9qKyoApYGxwDbWthbs5Q/4egGbOdk1tT26CbmQw8Dzr7b1/1ecobqVZwhP6DKPOFQw9nRQd7ZDzq0Z9JqXdTR8SRaVqKIrs3i7Vs8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2093
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10057
	signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
	phishscore=0
	suspectscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 mlxscore=0
	malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2107140000 definitions=main-2107270057
X-Proofpoint-GUID: nRpoq9RdipnqerhX_XQRJEo8WAMLGSPS
X-Proofpoint-ORIG-GUID: nRpoq9RdipnqerhX_XQRJEo8WAMLGSPS
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, kbuild-all@lists.01.org, lkp@intel.com,
	linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [gfs2:for-next.mmap-fault 6/9]
 fs/iomap/direct-io.c:134 iomap_dio_complete() error: dereferencing freed
 memory 'dio'
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git for-next.mmap-fault
head:   1e32783802dce0f79d3b25e800ac86bd24512e10
commit: cbbd26b20cafc8f40d495be172ba807dc260845c [6/9] iomap: Add done_before argument to iomap_dio_rw
config: x86_64-randconfig-m001-20210726 (attached as .config)
compiler: gcc-10 (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/iomap/direct-io.c:134 iomap_dio_complete() error: dereferencing freed memory 'dio'

vim +/dio +134 fs/iomap/direct-io.c

c3d4ed1abecfcf Christoph Hellwig   2020-09-28   80  ssize_t iomap_dio_complete(struct iomap_dio *dio)
db074436f42196 Darrick J. Wong     2019-07-15   81  {
838c4f3d7515ef Christoph Hellwig   2019-09-19   82  	const struct iomap_dio_ops *dops = dio->dops;
db074436f42196 Darrick J. Wong     2019-07-15   83  	struct kiocb *iocb = dio->iocb;
db074436f42196 Darrick J. Wong     2019-07-15   84  	struct inode *inode = file_inode(iocb->ki_filp);
db074436f42196 Darrick J. Wong     2019-07-15   85  	loff_t offset = iocb->ki_pos;
838c4f3d7515ef Christoph Hellwig   2019-09-19   86  	ssize_t ret = dio->error;
db074436f42196 Darrick J. Wong     2019-07-15   87  
838c4f3d7515ef Christoph Hellwig   2019-09-19   88  	if (dops && dops->end_io)
838c4f3d7515ef Christoph Hellwig   2019-09-19   89  		ret = dops->end_io(iocb, dio->size, ret, dio->flags);
db074436f42196 Darrick J. Wong     2019-07-15   90  
db074436f42196 Darrick J. Wong     2019-07-15   91  	if (likely(!ret)) {
db074436f42196 Darrick J. Wong     2019-07-15   92  		ret = dio->size;
db074436f42196 Darrick J. Wong     2019-07-15   93  		/* check for short read */
db074436f42196 Darrick J. Wong     2019-07-15   94  		if (offset + ret > dio->i_size &&
db074436f42196 Darrick J. Wong     2019-07-15   95  		    !(dio->flags & IOMAP_DIO_WRITE))
db074436f42196 Darrick J. Wong     2019-07-15   96  			ret = dio->i_size - offset;
db074436f42196 Darrick J. Wong     2019-07-15   97  		iocb->ki_pos += ret;
db074436f42196 Darrick J. Wong     2019-07-15   98  	}
db074436f42196 Darrick J. Wong     2019-07-15   99  
db074436f42196 Darrick J. Wong     2019-07-15  100  	/*
db074436f42196 Darrick J. Wong     2019-07-15  101  	 * Try again to invalidate clean pages which might have been cached by
db074436f42196 Darrick J. Wong     2019-07-15  102  	 * non-direct readahead, or faulted in by get_user_pages() if the source
db074436f42196 Darrick J. Wong     2019-07-15  103  	 * of the write was an mmap'ed region of the file we're writing.  Either
db074436f42196 Darrick J. Wong     2019-07-15  104  	 * one is a pretty crazy thing to do, so we don't support it 100%.  If
db074436f42196 Darrick J. Wong     2019-07-15  105  	 * this invalidation fails, tough, the write still worked...
db074436f42196 Darrick J. Wong     2019-07-15  106  	 *
838c4f3d7515ef Christoph Hellwig   2019-09-19  107  	 * And this page cache invalidation has to be after ->end_io(), as some
838c4f3d7515ef Christoph Hellwig   2019-09-19  108  	 * filesystems convert unwritten extents to real allocations in
838c4f3d7515ef Christoph Hellwig   2019-09-19  109  	 * ->end_io() when necessary, otherwise a racing buffer read would cache
db074436f42196 Darrick J. Wong     2019-07-15  110  	 * zeros from unwritten extents.
db074436f42196 Darrick J. Wong     2019-07-15  111  	 */
c114bbc6c423a4 Andreas Gruenbacher 2020-09-10  112  	if (!dio->error && dio->size &&
db074436f42196 Darrick J. Wong     2019-07-15  113  	    (dio->flags & IOMAP_DIO_WRITE) && inode->i_mapping->nrpages) {
db074436f42196 Darrick J. Wong     2019-07-15  114  		int err;
db074436f42196 Darrick J. Wong     2019-07-15  115  		err = invalidate_inode_pages2_range(inode->i_mapping,
db074436f42196 Darrick J. Wong     2019-07-15  116  				offset >> PAGE_SHIFT,
db074436f42196 Darrick J. Wong     2019-07-15  117  				(offset + dio->size - 1) >> PAGE_SHIFT);
db074436f42196 Darrick J. Wong     2019-07-15  118  		if (err)
db074436f42196 Darrick J. Wong     2019-07-15  119  			dio_warn_stale_pagecache(iocb->ki_filp);
db074436f42196 Darrick J. Wong     2019-07-15  120  	}
db074436f42196 Darrick J. Wong     2019-07-15  121  
1a31182edd0083 Goldwyn Rodrigues   2020-09-28  122  	inode_dio_end(file_inode(iocb->ki_filp));
db074436f42196 Darrick J. Wong     2019-07-15  123  	/*
db074436f42196 Darrick J. Wong     2019-07-15  124  	 * If this is a DSYNC write, make sure we push it to stable storage now
db074436f42196 Darrick J. Wong     2019-07-15  125  	 * that we've written data.
db074436f42196 Darrick J. Wong     2019-07-15  126  	 */
db074436f42196 Darrick J. Wong     2019-07-15  127  	if (ret > 0 && (dio->flags & IOMAP_DIO_NEED_SYNC))
db074436f42196 Darrick J. Wong     2019-07-15  128  		ret = generic_write_sync(iocb, ret);
db074436f42196 Darrick J. Wong     2019-07-15  129  
db074436f42196 Darrick J. Wong     2019-07-15  130  	kfree(dio);
                                                        ^^^^^^^^^^
free

db074436f42196 Darrick J. Wong     2019-07-15  131  
cbbd26b20cafc8 Andreas Gruenbacher 2021-07-24  132  	if (ret < 0)
db074436f42196 Darrick J. Wong     2019-07-15  133  		return ret;
cbbd26b20cafc8 Andreas Gruenbacher 2021-07-24 @134  	return dio->done_before + ret;
                                                               ^^^^^^^^^^^^^^^^
use after free

db074436f42196 Darrick J. Wong     2019-07-15  135  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

