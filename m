Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 455D5FCB9
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Apr 2019 17:24:14 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 92F56883BA;
	Tue, 30 Apr 2019 15:24:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC7DF7190D;
	Tue, 30 Apr 2019 15:24:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0D13018089CB;
	Tue, 30 Apr 2019 15:24:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3UFO0CI025577 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Apr 2019 11:24:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D0549100203C; Tue, 30 Apr 2019 15:24:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7846A1001DC8;
	Tue, 30 Apr 2019 15:23:58 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1927D85360;
	Tue, 30 Apr 2019 15:23:38 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x3UFL2xB106914; Tue, 30 Apr 2019 15:23:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=date : from : to : cc
	: subject : message-id : references : mime-version : content-type :
	in-reply-to; s=corp-2018-07-02;
	bh=UL8akE2341IVNeapyyvljzXu78o4iHQf73fw4k3T+ck=;
	b=VOiSvB1TwdwOo69mSHaxccRH1E6odKRb5cOsUUsQj440V3vY4aZGKv421ikURYdOycP1
	ct3/4rP7d0MUlAPcv4YPSgnSqVLLsTHp1efDmDWRoFHN/TbyVl7Nx8S6xEkgreOgl3Mo
	FJ03P711Q1Gil53/qs5cTp+moK6EjU1Vzzysc7tTx80vgeITZFT2h4iyFuk4fNrnJHNo
	lhaUY6LbzNyNyD+zEmynqFtKpGHzGPJfop9VidTOC647tGPs/KyejCRNHHdIgbIzPsnz
	uqbGuXFgAxL5Gx6w4FxjbB04SSgXNUw8XtxiLYA2+NWWktTQSjF5AmCZRZ8rJPpPQVWT
	RQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by userp2130.oracle.com with ESMTP id 2s5j5u1ynh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Apr 2019 15:23:29 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x3UFNC3A118995; Tue, 30 Apr 2019 15:23:29 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by aserp3020.oracle.com with ESMTP id 2s4ew1a8qp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Apr 2019 15:23:28 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x3UFNRcM008288;
	Tue, 30 Apr 2019 15:23:27 GMT
Received: from localhost (/67.169.218.210)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 30 Apr 2019 08:23:26 -0700
Date: Tue, 30 Apr 2019 08:23:25 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20190430152325.GD5200@magnolia>
References: <20190429220934.10415-1-agruenba@redhat.com>
	<20190429220934.10415-4-agruenba@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190429220934.10415-4-agruenba@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9243
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1810050000 definitions=main-1904300095
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9243
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
	definitions=main-1904300094
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.25]); Tue, 30 Apr 2019 15:23:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Tue, 30 Apr 2019 15:23:53 +0000 (UTC) for IP:'156.151.31.86'
	DOMAIN:'userp2130.oracle.com' HELO:'userp2130.oracle.com'
	FROM:'darrick.wong@oracle.com' RCPT:''
X-RedHat-Spam-Score: -102.465  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_MED, SPF_HELO_PASS,
	UNPARSEABLE_RELAY,
	USER_IN_WHITELIST) 156.151.31.86 userp2130.oracle.com 156.151.31.86
	userp2130.oracle.com <darrick.wong@oracle.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-mm@kvack.org,
	Dave Chinner <david@fromorbit.com>,
	Mark Syms <Mark.Syms@citrix.com>, cluster-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] [PATCH v7 3/5] iomap: Fix use-after-free error
 in page_done callback
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Tue, 30 Apr 2019 15:24:13 +0000 (UTC)

On Tue, Apr 30, 2019 at 12:09:32AM +0200, Andreas Gruenbacher wrote:
> In iomap_write_end, we're not holding a page reference anymore when
> calling the page_done callback, but the callback needs that reference to
> access the page.  To fix that, move the put_page call in
> __generic_write_end into the callers of __generic_write_end.  Then, in
> iomap_write_end, put the page after calling the page_done callback.
> 
> Reported-by: Jan Kara <jack@suse.cz>
> Fixes: 63899c6f8851 ("iomap: add a page_done callback")
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Looks ok,
Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>

--D

> ---
>  fs/buffer.c | 2 +-
>  fs/iomap.c  | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/buffer.c b/fs/buffer.c
> index e0d4c6a5e2d2..0faa41fb4c88 100644
> --- a/fs/buffer.c
> +++ b/fs/buffer.c
> @@ -2104,7 +2104,6 @@ void __generic_write_end(struct inode *inode, loff_t pos, unsigned copied,
>  	}
>  
>  	unlock_page(page);
> -	put_page(page);
>  
>  	if (old_size < pos)
>  		pagecache_isize_extended(inode, old_size, pos);
> @@ -2160,6 +2159,7 @@ int generic_write_end(struct file *file, struct address_space *mapping,
>  {
>  	copied = block_write_end(file, mapping, pos, len, copied, page, fsdata);
>  	__generic_write_end(mapping->host, pos, copied, page);
> +	put_page(page);
>  	return copied;
>  }
>  EXPORT_SYMBOL(generic_write_end);
> diff --git a/fs/iomap.c b/fs/iomap.c
> index f8c9722d1a97..62e3461704ce 100644
> --- a/fs/iomap.c
> +++ b/fs/iomap.c
> @@ -780,6 +780,7 @@ iomap_write_end(struct inode *inode, loff_t pos, unsigned len,
>  	__generic_write_end(inode, pos, ret, page);
>  	if (iomap->page_done)
>  		iomap->page_done(inode, pos, copied, page, iomap);
> +	put_page(page);
>  
>  	if (ret < len)
>  		iomap_write_failed(inode, pos, len);
> -- 
> 2.20.1
> 

