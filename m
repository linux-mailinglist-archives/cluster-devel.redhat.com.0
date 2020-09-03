Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6B7A525CFAF
	for <lists+cluster-devel@lfdr.de>; Fri,  4 Sep 2020 05:15:01 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-fkUlv8WuMauKrqFLkTdASQ-1; Thu, 03 Sep 2020 23:14:59 -0400
X-MC-Unique: fkUlv8WuMauKrqFLkTdASQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADA05801AEF;
	Fri,  4 Sep 2020 03:14:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B4205D9CC;
	Fri,  4 Sep 2020 03:14:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E6AEF1826D29;
	Fri,  4 Sep 2020 03:14:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 083LMfIp020235 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 3 Sep 2020 17:22:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B872EF6425; Thu,  3 Sep 2020 21:22:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B491EF51B1
	for <cluster-devel@redhat.com>; Thu,  3 Sep 2020 21:22:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0F3E101AA42
	for <cluster-devel@redhat.com>; Thu,  3 Sep 2020 21:22:38 +0000 (UTC)
Received: from sandeen.net (sandeen.net [63.231.237.45]) by
	relay.mimecast.com with ESMTP id us-mta-147-e0gMLJFYMmuJFrwOsAFPVA-1;
	Thu, 03 Sep 2020 17:22:37 -0400
X-MC-Unique: e0gMLJFYMmuJFrwOsAFPVA-1
Received: from liberator.sandeen.net (liberator.sandeen.net [10.0.0.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by sandeen.net (Postfix) with ESMTPSA id D94902ACC;
	Thu,  3 Sep 2020 16:12:09 -0500 (CDT)
To: Andreas Gruenbacher <agruenba@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	"Darrick J. Wong" <darrick.wong@oracle.com>
References: <20200903165632.1338996-1-agruenba@redhat.com>
From: Eric Sandeen <sandeen@sandeen.net>
Message-ID: <695a418c-ba6d-d3e9-f521-7dfa059764db@sandeen.net>
Date: Thu, 3 Sep 2020 16:12:33 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
	Gecko/20100101 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <20200903165632.1338996-1-agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 083LMfIp020235
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Thu, 03 Sep 2020 23:14:52 -0400
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, cluster-devel@redhat.com,
	linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH] iomap: Fix direct I/O write consistency
	check
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 9/3/20 11:56 AM, Andreas Gruenbacher wrote:
> When a direct I/O write falls back to buffered I/O entirely, dio->size
> will be 0 in iomap_dio_complete.  Function invalidate_inode_pages2_range
> will try to invalidate the rest of the address space.

(Because if ->size == 0 and offset == 0, then invalidating up to (0+0-1) will
invalidate the entire range.)


                err = invalidate_inode_pages2_range(inode->i_mapping,
                                offset >> PAGE_SHIFT,
                                (offset + dio->size - 1) >> PAGE_SHIFT);

so I guess this behavior is unique to writing to a hole at offset 0?

FWIW, this same test yields the same results on ext3 when it falls back to
buffered.

-Eric

> If there are any
> dirty pages in that range, the write will fail and a "Page cache
> invalidation failure on direct I/O" error will be logged.
> 
> On gfs2, this can be reproduced as follows:
> 
>   xfs_io \
>     -c "open -ft foo" -c "pwrite 4k 4k" -c "close" \
>     -c "open -d foo" -c "pwrite 0 4k"
> 
> Fix this by recognizing 0-length writes.
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> ---
>  fs/iomap/direct-io.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> index c1aafb2ab990..c9d6b4eecdb7 100644
> --- a/fs/iomap/direct-io.c
> +++ b/fs/iomap/direct-io.c
> @@ -108,7 +108,7 @@ static ssize_t iomap_dio_complete(struct iomap_dio *dio)
>  	 * ->end_io() when necessary, otherwise a racing buffer read would cache
>  	 * zeros from unwritten extents.
>  	 */
> -	if (!dio->error &&
> +	if (!dio->error && dio->size &&
>  	    (dio->flags & IOMAP_DIO_WRITE) && inode->i_mapping->nrpages) {
>  		int err;
>  		err = invalidate_inode_pages2_range(inode->i_mapping,
> 


