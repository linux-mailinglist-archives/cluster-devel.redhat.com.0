Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id DC1381FC1C1
	for <lists+cluster-devel@lfdr.de>; Wed, 17 Jun 2020 00:37:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592347048;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=pjA7zgwqv80y4xmAR3IWOMUOAyE53XKax4l1DtqqEck=;
	b=h8mrJrM5cDIKvS5QoALyb6RslgthLDv9hL5QnoeKP5vzWZPaJI+R6Z3FsDCbSHTaSVZx1X
	Y/RiflL0FdUU1jhO/za4sOu8SKXZVx2QKT+0rew+w5gepdub56sg684C5qwNlxMLTtZTu4
	WG+2o6TCrwSQTKJ6XTgYVxlQipohgLk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-0SjJIjfdNy6RXc4JhWMKUw-1; Tue, 16 Jun 2020 18:37:27 -0400
X-MC-Unique: 0SjJIjfdNy6RXc4JhWMKUw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E8358010EC;
	Tue, 16 Jun 2020 22:37:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11E0D79316;
	Tue, 16 Jun 2020 22:37:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1E0B0833C1;
	Tue, 16 Jun 2020 22:37:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05GMaTUW015927 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 16 Jun 2020 18:36:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C64C5B3516; Tue, 16 Jun 2020 22:36:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C19B6B5523
	for <cluster-devel@redhat.com>; Tue, 16 Jun 2020 22:36:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E6408007CB
	for <cluster-devel@redhat.com>; Tue, 16 Jun 2020 22:36:27 +0000 (UTC)
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
	[209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-95-OcwlBuNOPEK71EiKp1_xJA-1; Tue, 16 Jun 2020 18:36:25 -0400
X-MC-Unique: OcwlBuNOPEK71EiKp1_xJA-1
Received: by mail-ot1-f70.google.com with SMTP id w13so160070otq.13
	for <cluster-devel@redhat.com>; Tue, 16 Jun 2020 15:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pjA7zgwqv80y4xmAR3IWOMUOAyE53XKax4l1DtqqEck=;
	b=sd0hjUheLYfC704RBcyXqcq4INjmz94R78BHoqW9u9xgSk2+YcKkvTTlJIfxeNYynr
	ehQggtkjdwGyvypnaEEi6HLIjRoWRvqMYLC0V1ODd0VskAmJ+3f0ds8nE2PDzsVTlyVM
	Uf67yWKJc4JIo9tgs/ZBBVOitXSAIKcQJM4UpFfuhpj66ZyVVWq/4pJvTxbJBLW5V07d
	tb9FcrZIw/GctQ58Wnp0Dj4wtAN0SeaUxh2xT9VaEYa6QkpHF3F5akZ+oa+7V0N0UzqW
	5dDw3JyQVXhsiKLs3j4Ig8c12XP7O9YvWjDLqnDLSh7ktZCwNsxU9U5FO2sG6GTNmMSL
	tU3w==
X-Gm-Message-State: AOAM533omV3q2im0JmnYCu2WEPyY56nmsBdeQS/43iP3uWjzvnTFpbLP
	O1W2fIQBYjc0MDAq8uZo+xpL9/H1Q+9yCB0oPUtkDqeyk1QOP3smvAdsc3UXt9mPSXnHvQMjEmV
	j6WAPikeDoh3txa4L0f7Q/wGm+vi59oBxFATxKg==
X-Received: by 2002:a9d:6e96:: with SMTP id a22mr4427240otr.58.1592346984855; 
	Tue, 16 Jun 2020 15:36:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoYNEk859HKJnIJ4XSJZ0fYGYB8IyuHx9XmftKrB9TO1HP0sg3cpUFv1zd47ilgV+zJ3II6JUZaM7vtE9AC3A=
X-Received: by 2002:a9d:6e96:: with SMTP id a22mr4427227otr.58.1592346984642; 
	Tue, 16 Jun 2020 15:36:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200414150233.24495-1-willy@infradead.org>
	<20200414150233.24495-17-willy@infradead.org>
In-Reply-To: <20200414150233.24495-17-willy@infradead.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 17 Jun 2020 00:36:13 +0200
Message-ID: <CAHc6FU4m1M7Tv4scX0UxSiVBqkL=Vcw_z-R7SufL8k7Bw=qPOw@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	linux-ext4 <linux-ext4@vger.kernel.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	John Hubbard <jhubbard@nvidia.com>, LKML <linux-kernel@vger.kernel.org>,
	Junxiao Bi <junxiao.bi@oracle.com>, linux-xfs@vger.kernel.org,
	William Kucharski <william.kucharski@oracle.com>,
	Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-erofs@lists.ozlabs.org, Linux-MM <linux-mm@kvack.org>,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v11 16/25] fs: Convert mpage_readpages
	to mpage_readahead
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Am Mi., 15. Apr. 2020 um 23:39 Uhr schrieb Matthew Wilcox <willy@infradead.org>:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>
> Implement the new readahead aop and convert all callers (block_dev,
> exfat, ext2, fat, gfs2, hpfs, isofs, jfs, nilfs2, ocfs2, omfs, qnx6,
> reiserfs & udf).  The callers are all trivial except for GFS2 & OCFS2.

This patch leads to an ABBA deadlock in xfstest generic/095 on gfs2.

Our lock hierarchy is such that the inode cluster lock ("inode glock")
for an inode needs to be taken before any page locks in that inode's
address space. However, the readahead address space operation is
called with the pages already locked. When we try to grab the inode
glock inside gfs2_readahead, we'll deadlock with processes that are
holding that inode glock and trying to lock one of those same pages.

One possible solution is to use a trylock on the glock in
gfs2_readahead, and to give up the readahead in case of a locking
conflict. I have no idea how this is going to affect performance.

Any other ideas?

Thanks,
Andreas

