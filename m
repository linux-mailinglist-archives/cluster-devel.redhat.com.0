Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 97804552CB
	for <lists+cluster-devel@lfdr.de>; Tue, 25 Jun 2019 17:03:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 642833082E64;
	Tue, 25 Jun 2019 15:03:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D61186012C;
	Tue, 25 Jun 2019 15:03:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 02500206D4;
	Tue, 25 Jun 2019 15:03:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5PF0Udd013859 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 25 Jun 2019 11:00:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D3DD160C69; Tue, 25 Jun 2019 15:00:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE1BB60BE2
	for <cluster-devel@redhat.com>; Tue, 25 Jun 2019 15:00:28 +0000 (UTC)
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
	[209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F25D461CD
	for <cluster-devel@redhat.com>; Tue, 25 Jun 2019 15:00:28 +0000 (UTC)
Received: by mail-ot1-f69.google.com with SMTP id r2so9234559oti.10
	for <cluster-devel@redhat.com>; Tue, 25 Jun 2019 08:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=70GK+AO3uKZgZ8D6gQdcBKHcRe1VNXglbQbcE8WJm74=;
	b=A4Yo623/bqM16fCFvBKnv0Ah5KcbmlPhtBcRMcYPD5348fKyhPcDbrQFXzbI0Pcgp4
	PG+Er3qGGd14SZT7Ob+4XGiQHHvEa8+AAhm7bQW6CibPk0tMV+oomIB9VX/n5306chJt
	WapEfaGZM0BtKCukEYICfxVmE6FEbuWZBZyqefAcL0eLU6ekNouhw/DUbZLItHzUpLn1
	M0gALtvJJ9YS+ZQZPNMn22GD7XKsbZ57SGGyQHnUPnOxlq197+33KiA0cdwpaAV584Qj
	nr5r70mIES5KuOA0QG3eo0HqEyzRffHGjL3n5zwN7S+y2/+UWqrjwydQDOabNiso/BJR
	G3hg==
X-Gm-Message-State: APjAAAVvma0UhWLzJUek8BWdfW+GlycArBxaa4fW4vD05hY7SHQ05zNy
	OgTvx3sJEIK7Jw8bfsDSF9LDc+ifP51rMVPi+Mbp1zT4uxEXMaTU5CHjJUdAmRAanaGZ0uich3k
	xNtZzkE11idW/Vx1VVXr5DuAh02zYQBckCrIWzg==
X-Received: by 2002:aca:72d0:: with SMTP id
	p199mr14884173oic.178.1561474827691; 
	Tue, 25 Jun 2019 08:00:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwVfRfIKs2VVNJMH0Mkm6UR86DyT56S+wxjZ8DOyZk2D51KNnNrKZ+AMlENIW6mD4mWEAqIylIPnsGNSY7gwk8=
X-Received: by 2002:aca:72d0:: with SMTP id
	p199mr14884156oic.178.1561474827425; 
	Tue, 25 Jun 2019 08:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190618144716.8133-1-agruenba@redhat.com>
	<20190624065408.GA3565@lst.de>
	<20190624182243.22447-1-agruenba@redhat.com>
	<20190625095707.GA1462@lst.de>
In-Reply-To: <20190625095707.GA1462@lst.de>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 25 Jun 2019 17:00:16 +0200
Message-ID: <CAHc6FU5=WPY2nKYLmTzoiuiCYycad6F18FJPmm3dWCBV-PpJJw@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, Jan Kara <jack@suse.cz>
Subject: Re: [Cluster-devel] [PATCH] fs: Move mark_inode_dirty out of
	__generic_write_end
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Tue, 25 Jun 2019 15:03:53 +0000 (UTC)

On Tue, 25 Jun 2019 at 11:57, Christoph Hellwig <hch@lst.de> wrote:
> On Mon, Jun 24, 2019 at 08:22:43PM +0200, Andreas Gruenbacher wrote:
> > That would work, but I don't like how this leaves us with a vfs function
> > that updates i_size without bothering to dirty the inode very much.
>
> This isn't a VFS function, it is a helper library.

Well, let's call it that if this suits you better.

> > How about if we move the __generic_write_end call into the page_done
> > callback and leave special handling to the filesystem code if needed
> > instead?  The below patch seems to work for gfs2.
>
> That seems way more complicated.  I'd much rather go with something
> like may patch plus maybe a big fat comment explaining that persisting
> the size update is the file systems job.  Note that a lot of the modern
> file systems don't use the VFS inode tracking for that, besides XFS
> that includes at least btrfs and ocfs2 as well.

Andreas

