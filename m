Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5F556228A17
	for <lists+cluster-devel@lfdr.de>; Tue, 21 Jul 2020 22:40:51 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-DfZegZdSMmeELySAGiv1nQ-1; Tue, 21 Jul 2020 16:40:48 -0400
X-MC-Unique: DfZegZdSMmeELySAGiv1nQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 849E110059A7;
	Tue, 21 Jul 2020 20:40:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E3A02B6DC;
	Tue, 21 Jul 2020 20:40:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B3360730DA;
	Tue, 21 Jul 2020 20:40:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06LKZPHQ001340 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 21 Jul 2020 16:35:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A099F11FC77; Tue, 21 Jul 2020 20:35:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BD0B11FC80
	for <cluster-devel@redhat.com>; Tue, 21 Jul 2020 20:35:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBF501832D2B
	for <cluster-devel@redhat.com>; Tue, 21 Jul 2020 20:35:22 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-464-SxdqwTltP96ZoqG9qMDS1g-1; Tue, 21 Jul 2020 16:35:20 -0400
X-MC-Unique: SxdqwTltP96ZoqG9qMDS1g-1
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	06LKRJV3175529; Tue, 21 Jul 2020 20:35:11 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2120.oracle.com with ESMTP id 32d6ksktu4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 21 Jul 2020 20:35:11 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	06LKXIgM147407; Tue, 21 Jul 2020 20:35:10 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by aserp3030.oracle.com with ESMTP id 32e3vet5sa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jul 2020 20:35:10 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06LKZ8fM018008;
	Tue, 21 Jul 2020 20:35:08 GMT
Received: from localhost (/10.159.147.229)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 21 Jul 2020 20:35:08 +0000
Date: Tue, 21 Jul 2020 13:35:05 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200721203505.GE3151642@magnolia>
References: <20200721183157.202276-1-hch@lst.de>
	<20200721183157.202276-2-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200721183157.202276-2-hch@lst.de>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9689
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
	suspectscore=1
	adultscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
	phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2007210135
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9689
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
	suspectscore=1
	bulkscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0
	priorityscore=1501
	lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2007210135
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
	Damien Le Moal <damien.lemoal@wdc.com>,
	linux-ext4@vger.kernel.org, Goldwyn Rodrigues <rgoldwyn@suse.de>,
	Dave Chinner <david@fromorbit.com>,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	linux-fsdevel@vger.kernel.org,
	Johannes Thumshirn <jth@kernel.org>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 1/3] xfs: use ENOTBLK for direct I/O to
 buffered I/O fallback
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 21, 2020 at 08:31:55PM +0200, Christoph Hellwig wrote:
> This is what the classic fs/direct-io.c implementation and thuse other
> file systems use.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks ok to me,
Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>

--D

> ---
>  fs/xfs/xfs_file.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
> index 00db81eac80d6c..a6ef90457abf97 100644
> --- a/fs/xfs/xfs_file.c
> +++ b/fs/xfs/xfs_file.c
> @@ -505,7 +505,7 @@ xfs_file_dio_aio_write(
>  		 */
>  		if (xfs_is_cow_inode(ip)) {
>  			trace_xfs_reflink_bounce_dio_write(ip, iocb->ki_pos, count);
> -			return -EREMCHG;
> +			return -ENOTBLK;
>  		}
>  		iolock = XFS_IOLOCK_EXCL;
>  	} else {
> @@ -714,7 +714,7 @@ xfs_file_write_iter(
>  		 * allow an operation to fall back to buffered mode.
>  		 */
>  		ret = xfs_file_dio_aio_write(iocb, from);
> -		if (ret != -EREMCHG)
> +		if (ret != -ENOTBLK)
>  			return ret;
>  	}
>  
> -- 
> 2.27.0
> 

