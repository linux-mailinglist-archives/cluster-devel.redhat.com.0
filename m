Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F3E6B34DD
	for <lists+cluster-devel@lfdr.de>; Fri, 10 Mar 2023 04:32:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678419163;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=5nYji9aiOTPkm277QrYAaIqlTmxJJ+NstcSRT3Yv5A4=;
	b=aPEdYhtSf8SHc3/CBR8Bzw1lY7W3UDTnrqbYVllnHoTPjqda43zNBEX/FeoOSCoCxXe0Ge
	EU2c0H4ZDxyg10U5p1HBHS9Ljzpk6lWob/lh2TkMO6rst9uakTZu7Ce+wNqT3e7ZZEbGnY
	oqU2zsnXh7zrVd1Dm/4dFqpHDvYufQQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-185-EriGMTAcPd6MonFGJYLFjw-1; Thu, 09 Mar 2023 22:32:35 -0500
X-MC-Unique: EriGMTAcPd6MonFGJYLFjw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA70C802D2A;
	Fri, 10 Mar 2023 03:32:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 90E08440DD;
	Fri, 10 Mar 2023 03:32:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6C64E1946A49;
	Fri, 10 Mar 2023 03:32:34 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CDEBF1946597 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 10 Mar 2023 03:32:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 998A12026D76; Fri, 10 Mar 2023 03:32:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91AF72026D68
 for <cluster-devel@redhat.com>; Fri, 10 Mar 2023 03:32:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 726F1811E6E
 for <cluster-devel@redhat.com>; Fri, 10 Mar 2023 03:32:33 +0000 (UTC)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-328-lRRreOs5MA2E3qDGbIkw4g-1; Thu,
 09 Mar 2023 22:32:31 -0500
X-MC-Unique: lRRreOs5MA2E3qDGbIkw4g-1
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1paTUM-00FCbC-06; Fri, 10 Mar 2023 03:32:14 +0000
Date: Fri, 10 Mar 2023 03:32:13 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <20230310033213.GG3390869@ZenIV>
References: <20230309152127.41427-1-frank.li@vivo.com>
 <20230309152127.41427-4-frank.li@vivo.com>
 <20230310031940.GE3390869@ZenIV>
MIME-Version: 1.0
In-Reply-To: <20230310031940.GE3390869@ZenIV>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH v3 4/6] ext4: convert to use
 i_blockmask()
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: brauner@kernel.org, tytso@mit.edu, joseph.qi@linux.alibaba.com,
 mark@fasheh.com, chao@kernel.org, linux-kernel@vger.kernel.org,
 cluster-devel@redhat.com, huyue2@coolpad.com, adilger.kernel@dilger.ca,
 jlbec@evilplan.org, jefflexu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
 xiang@kernel.org, linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 10, 2023 at 03:19:40AM +0000, Al Viro wrote:
> On Thu, Mar 09, 2023 at 11:21:25PM +0800, Yangtao Li wrote:
> > Use i_blockmask() to simplify code.
> > 
> > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> > ---
> > v3:
> > -none
> > v2:
> > -convert to i_blockmask()
> >  fs/ext4/inode.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> > index d251d705c276..eec36520e5e9 100644
> > --- a/fs/ext4/inode.c
> > +++ b/fs/ext4/inode.c
> > @@ -2218,7 +2218,7 @@ static int mpage_process_page_bufs(struct mpage_da_data *mpd,
> >  {
> >  	struct inode *inode = mpd->inode;
> >  	int err;
> > -	ext4_lblk_t blocks = (i_size_read(inode) + i_blocksize(inode) - 1)
> > +	ext4_lblk_t blocks = (i_size_read(inode) + i_blockmask(inode))
> >  							>> inode->i_blkbits;
> 
> Umm...  That actually asks for DIV_ROUND_UP(i_size_read_inode(), i_blocksize(inode)) -
> compiler should bloody well be able to figure out that division by (1 << n) is
> shift down by n and it's easier to follow that way...

BTW, here the fact that you are adding the mask is misleading - it's true,
but we are not using it as a mask - it's straight arithmetics.

One can do an equivalent code where it would've been used as a mask, but that
would be harder to read -
	(((i_size_read(inode) - 1) | i_blockmask(inode)) + 1) >> inode->i_blkbits
and I doubt anyone wants that kind of puzzles to stumble upon.

