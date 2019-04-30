Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D54FEFD0F
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Apr 2019 17:39:51 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 110353078AA0;
	Tue, 30 Apr 2019 15:39:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4432799A;
	Tue, 30 Apr 2019 15:39:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0E54F18089CB;
	Tue, 30 Apr 2019 15:39:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3UFdiHO027996 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Apr 2019 11:39:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 57E964148; Tue, 30 Apr 2019 15:39:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5329817BBB
	for <cluster-devel@redhat.com>; Tue, 30 Apr 2019 15:39:41 +0000 (UTC)
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
	[209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6B36789C3D
	for <cluster-devel@redhat.com>; Tue, 30 Apr 2019 15:39:41 +0000 (UTC)
Received: by mail-oi1-f197.google.com with SMTP id y4so5635245oix.12
	for <cluster-devel@redhat.com>; Tue, 30 Apr 2019 08:39:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jDm6QOW6C+ywZne3LW7Ypw7lAdQTfas17MrrXq3ecwo=;
	b=DxOrJ8BvkOStpVgrrFHIq9YQYC6fmCLqqkz7j8co5RbXmLcQ0meka411yr+8N5a/27
	p3JzlkaTZZyTY8VYqcEP+77beTLo305KT3VI/U0KR0yXrP7VjR0vQ0HuwD5tyPboZi0A
	HnQpijwVGLJTI+UtagrM8p4ZWJq3lMmYOkwDowU+F/2rIwo3RW7qdv12/yLTg2OvYxTY
	zTu4N33pnD4fNOHaxSo2UFaqc0XQjCw9bQitxIA9Oii9L4LiUxPt+4JtqGiM9DPzOSSr
	lUSKlkC1Iw7Jhcj/E0LqyS45a74n6uM1mGN+YTOQRObKa/U6rhZOkK4oHZdLKrwmwYkJ
	X0FA==
X-Gm-Message-State: APjAAAXS5Uw3//kfIXVl6uk0zshad6/dxfh3g5lwNgrbntLDlq7E3aec
	Bhrie8JqNYzCzwusUyujvTEkd7DmoGOeLsxngAGZEKf8TX0hRpVoL9sVyEEUv68PU1KuVQ9Euo8
	dUsdqZKaZu759nuJXtuoxqMd/99QOoiv1g4DDTA==
X-Received: by 2002:a9d:7d06:: with SMTP id v6mr15700505otn.187.1556638780711; 
	Tue, 30 Apr 2019 08:39:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw8N8JoFFbtJVwle+z88rtJCuTvvxvCdMMXpDMhyN036qx9KAapBJJNOssCOcuQfUZoHwNGv9RcjuZWCQxY7v4=
X-Received: by 2002:a9d:7d06:: with SMTP id v6mr15700460otn.187.1556638779909; 
	Tue, 30 Apr 2019 08:39:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190429220934.10415-1-agruenba@redhat.com>
	<20190429220934.10415-6-agruenba@redhat.com>
	<20190430153256.GF5200@magnolia>
In-Reply-To: <20190430153256.GF5200@magnolia>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 30 Apr 2019 17:39:28 +0200
Message-ID: <CAHc6FU5hHFWeGM8+fhfaNs22cSG+wtuTKZcMMKbfeetg1CK4BQ@mail.gmail.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-mm@kvack.org,
	Dave Chinner <david@fromorbit.com>, Mark Syms <Mark.Syms@citrix.com>,
	cluster-devel <cluster-devel@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] [PATCH v7 5/5] gfs2: Fix iomap write page
	reclaim deadlock
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Tue, 30 Apr 2019 15:39:50 +0000 (UTC)

On Tue, 30 Apr 2019 at 17:33, Darrick J. Wong <darrick.wong@oracle.com> wrote:
> On Tue, Apr 30, 2019 at 12:09:34AM +0200, Andreas Gruenbacher wrote:
> > Since commit 64bc06bb32ee ("gfs2: iomap buffered write support"), gfs2 is doing
> > buffered writes by starting a transaction in iomap_begin, writing a range of
> > pages, and ending that transaction in iomap_end.  This approach suffers from
> > two problems:
> >
> >   (1) Any allocations necessary for the write are done in iomap_begin, so when
> >   the data aren't journaled, there is no need for keeping the transaction open
> >   until iomap_end.
> >
> >   (2) Transactions keep the gfs2 log flush lock held.  When
> >   iomap_file_buffered_write calls balance_dirty_pages, this can end up calling
> >   gfs2_write_inode, which will try to flush the log.  This requires taking the
> >   log flush lock which is already held, resulting in a deadlock.
>
> /me wonders how holding the log flush lock doesn't seriously limit
> performance, but gfs2 isn't my fight so I'll set that aside and assume
> that a patch S-o-B'd by both maintainers is ok. :)

This only affects inline and journaled data, not standard writes, so
it's not quite as bad as it looks.

> How should we merge this patch #5?  It doesn't touch fs/iomap.c itself,
> so do you want me to pull it into the iomap branch along with the
> previous four patches?  That would be fine with me (and easier than a
> multi-tree merge mess)...

I'd prefer to get this merged via the gfs2 tree once the iomap fixes
have been pulled.

Thanks,
Andreas

