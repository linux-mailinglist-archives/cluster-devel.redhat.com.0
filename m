Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA1F11E65B
	for <lists+cluster-devel@lfdr.de>; Fri, 13 Dec 2019 16:21:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576250511;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ueGZaQwTG7693PmZ2+iBU58SpNOEWgOidTrP5iCgtIc=;
	b=QmAHH6RcuiOMPO90BVY4CaN3GVXnnEMM9zCEbWN38bNO8wbpc702J+m0z9BYT+2rFsMaDA
	KseQoLGFX5tkmgeD85ze4PXLqjXhAkp1htjW6Oa422pXCvWx5gSBmZAmAWaevfRKt+A5nS
	eYrHbPBFeS3Vg0l0t5+rmAvgsFSO7Uk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-Jt2oyYENMwudjx7sUV04iQ-1; Fri, 13 Dec 2019 10:21:49 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9259D801E7E;
	Fri, 13 Dec 2019 15:21:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 038DD5C219;
	Fri, 13 Dec 2019 15:21:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DCAD818095FF;
	Fri, 13 Dec 2019 15:21:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBDFLfsx002119 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 13 Dec 2019 10:21:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D438887A4; Fri, 13 Dec 2019 15:21:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CDB6C60BCA
	for <cluster-devel@redhat.com>; Fri, 13 Dec 2019 15:21:39 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4BD1318095FF;
	Fri, 13 Dec 2019 15:21:39 +0000 (UTC)
Date: Fri, 13 Dec 2019 10:21:39 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <885856777.953877.1576250499126.JavaMail.zimbra@redhat.com>
In-Reply-To: <fb4c9a28-f1ac-3189-cfe0-e848b2ff8e56@citrix.com>
References: <fb4c9a28-f1ac-3189-cfe0-e848b2ff8e56@citrix.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.116.248, 10.4.195.21]
Thread-Topic: Follow up to "kernel BUG at fs/gfs2/inode.h:64"
Thread-Index: hwtfTLdA/FRIYiUKEpMyFdPtMyKvQQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Mark Syms <Mark.Syms@citrix.com>
Subject: Re: [Cluster-devel] Follow up to "kernel BUG at fs/gfs2/inode.h:64"
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
X-MC-Unique: Jt2oyYENMwudjx7sUV04iQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> Reviving the thread "kernel BUG at fs/gfs2/inode.h:64" from January [1]...
> 
> We finally hit the assertion in gfs2_add_inode_blocks() after it has
> been fixed. Debug logging showed that in sweep_bh_for_rgrps():
> 
> blen = 1
> isize_blks = 0
> 
> which is then used as follows:
> 
> __gfs2_free_blocks(ip, bstart, (u32)blen, meta);
> (*btotal) += blen;
> gfs2_add_inode_blocks(&ip->i_inode, -blen);
> 
> This confirms Tim's suspicion that i_blocks is already 0 at the
> point we're trying to free a block.
> 
> Any ideas on how this situation may have occurred? The test case
> power-cycles hosts so perhaps this is some form of corruption that
> would be fixed by Bob's recovery patch series?
> 
> [1] https://www.redhat.com/archives/cluster-devel/2019-January/msg00007.html
> 
> Thanks,
> --
> Ross Lagerwall

Hi Ross,

It's very possible that the corruption is due to one of the many problems
I've found with journal replay.

The solution is first to fix the file system with fsck.gfs2, and perhaps
then try one of my newer recovery kernels. My latest upstream version is
for-next.recovery13c and it's been pretty well tested.

I've been working on additional patches, but hopefully you won't need
them for what you're doing.

Regards,

Bob Peterson
Red Hat File Systems

