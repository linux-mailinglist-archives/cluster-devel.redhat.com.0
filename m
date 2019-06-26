Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id AA23857258
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Jun 2019 22:11:20 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 53E6D81F1B;
	Wed, 26 Jun 2019 20:11:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AE7D6012D;
	Wed, 26 Jun 2019 20:11:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D41061806B0E;
	Wed, 26 Jun 2019 20:10:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5QKAMD2028887 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 Jun 2019 16:10:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 74AC2608D0; Wed, 26 Jun 2019 20:10:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24890608CA;
	Wed, 26 Jun 2019 20:10:20 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4993B307D91F;
	Wed, 26 Jun 2019 20:09:53 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x5QK9CW2179945; Wed, 26 Jun 2019 20:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=date : from : to : cc
	: subject : message-id : references : mime-version : content-type :
	in-reply-to; s=corp-2018-07-02;
	bh=+gwSshYVuRmT5asPtC7EtaE2rYMHlZqALtRin1Cfo7s=;
	b=2ZHWFR7pAG2Yuh0PbkMJHrIi7GyLlBAEa5ORNAdXauj4d9vcPTDtBbq7CqVDPmFVobs3
	GgBH3eiJuuSLmTgF9TinWPTP3TXaBz1NssvreqJ8PSHAytFP0AJBvwXo8nHrcKXTYR9v
	NqqKi2YtNqBMhbqy2Vj5hohOqrNGa4un0gcvaRxAQmfLpFjC8NgtLBN/Bq+ZtR8uOMGr
	ByeH+iXcEyha5m4wmSMbLJkQD36TR4Jgk5oAwCofsgjJvKFsTcd/LxvE1Jw+fCljP1OK
	F+Ud/nN0jq85GS8iDF/RvUN8ZTR57+dpHjzbIZQvS7qAmavhgPkcRdqLE3mI2skGt+Ld
	VQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by userp2130.oracle.com with ESMTP id 2t9brtcg0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jun 2019 20:09:49 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x5QK8697128008; Wed, 26 Jun 2019 20:09:49 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by userp3030.oracle.com with ESMTP id 2t99f4ne1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jun 2019 20:09:49 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5QK9mAH028224;
	Wed, 26 Jun 2019 20:09:48 GMT
Received: from localhost (/67.169.218.210)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 26 Jun 2019 13:09:47 -0700
Date: Wed, 26 Jun 2019 13:09:46 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20190626200946.GK5171@magnolia>
References: <20190626132335.14809-1-agruenba@redhat.com>
	<20190626132335.14809-3-agruenba@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190626132335.14809-3-agruenba@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9300
	signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1810050000 definitions=main-1906260233
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9300
	signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
	definitions=main-1906260233
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.48]); Wed, 26 Jun 2019 20:10:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Wed, 26 Jun 2019 20:10:03 +0000 (UTC) for IP:'156.151.31.86'
	DOMAIN:'userp2130.oracle.com' HELO:'userp2130.oracle.com'
	FROM:'darrick.wong@oracle.com' RCPT:''
X-RedHat-Spam-Score: -102.4  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_MED, SPF_HELO_PASS, SPF_NONE,
	UNPARSEABLE_RELAY,
	USER_IN_WHITELIST) 156.151.31.86 userp2130.oracle.com 156.151.31.86
	userp2130.oracle.com <darrick.wong@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: linux-fsdevel@vger.kernel.org, cluster-devel@redhat.com,
	linux-xfs@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] [PATCH v2 3/3] iomap: fix page_done callback
	for short writes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Wed, 26 Jun 2019 20:11:19 +0000 (UTC)

On Wed, Jun 26, 2019 at 03:23:35PM +0200, Andreas Gruenbacher wrote:
> When we truncate a short write to have it retried, pass the truncated
> length to the page_done callback instead of the full length.
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>

LGTM,
Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>

--D

> ---
>  fs/iomap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/iomap.c b/fs/iomap.c
> index 97569064faaa..9a9d016b2782 100644
> --- a/fs/iomap.c
> +++ b/fs/iomap.c
> @@ -803,7 +803,7 @@ iomap_write_end(struct inode *inode, loff_t pos, unsigned len,
>  	if (old_size < pos)
>  		pagecache_isize_extended(inode, old_size, pos);
>  	if (page_ops && page_ops->page_done)
> -		page_ops->page_done(inode, pos, copied, page, iomap);
> +		page_ops->page_done(inode, pos, ret, page, iomap);
>  	put_page(page);
>  
>  	if (ret < len)
> -- 
> 2.20.1
> 

