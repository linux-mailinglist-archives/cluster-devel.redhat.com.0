Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 17057108AA8
	for <lists+cluster-devel@lfdr.de>; Mon, 25 Nov 2019 10:17:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574673469;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=V7hIm5y4uw5lqskG87oq4ziNwzL76XbukhX4bOt3aeE=;
	b=eGtT01W3K1+ETFfPPdnrZ/784Jzhcn9n+/16ScBfRY8C72HWWmi9yoGxgTg5Bh7/4bBpT0
	EI/a90s7W3P3M5xbWqVUlHa+ee2BF7lsDDXt6VnXrRceMHXKPxD0sKcLjhAMa90dBo9drx
	1OfqP+DqlnDUCAXwkoVA7C5+JTRAAEA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-xCWMlD3FNj686HFGgc4mhA-1; Mon, 25 Nov 2019 04:17:48 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A63A18B9FC4;
	Mon, 25 Nov 2019 09:17:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F4CF1001925;
	Mon, 25 Nov 2019 09:17:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F04A618089C8;
	Mon, 25 Nov 2019 09:17:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAP9HfVA008599 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 25 Nov 2019 04:17:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8335C2166B2C; Mon, 25 Nov 2019 09:17:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EDA32166B28
	for <cluster-devel@redhat.com>; Mon, 25 Nov 2019 09:17:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B5A91023F8A
	for <cluster-devel@redhat.com>; Mon, 25 Nov 2019 09:17:39 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-171-9JxdEVKdOHG2Ns1Ifu0imw-1; Mon, 25 Nov 2019 04:17:35 -0500
Received: by mail-lj1-f195.google.com with SMTP id y23so14880080ljh.10
	for <cluster-devel@redhat.com>; Mon, 25 Nov 2019 01:17:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ZHZjuct0CLXN3AYcQ+YfYJz+luTtYA/oliVypF8e6hc=;
	b=RqNJSp5p2+nivd+CXJQo+5Xd1doP9BdbR2SMDFPwxwG5PNtvK3DvjxG4jvjvdumxEq
	Ea8ZWTXR1+LwsoVR909SQ5FJlaqTJVAgfA3HxBAJ9LZ1cpga06/5z6PO8q+giRNg+jJs
	6cy0b+F1ToOg/ikZPDHsCQrqvZJhpeuq0ftkiyK77Z4eaG1fOYjUHO7OXsSN6wrp0FME
	vY88wB47oR4mrtjub4zfTDjoBZRK28/nAE9/NaxOXFZzq0ZTdUQu6NWReCicwD8mbaUA
	5TCoCgEBfKYERGcMb9naro2zNKWTc1P+dyTheTh8kT7wA4iGz0aM7RkZ4vqC5dkpC5T1
	qA2w==
X-Gm-Message-State: APjAAAVn0N0ylSx6hjd0f344Zh8KhNd2sBnHyOhvoxmYxhyWq0NCLncl
	/APi2quFO6YJ9Rgxqsqxq4e4Uw==
X-Google-Smtp-Source: APXvYqxd5dos5A6z8ycGXVe7nHwhuoFOM7ml7F4GD0vhqjvmIeNnVd78WDsUG2ScyfwFJZNDkXJSMg==
X-Received: by 2002:a2e:760d:: with SMTP id r13mr20970401ljc.15.1574673453729; 
	Mon, 25 Nov 2019 01:17:33 -0800 (PST)
Received: from box.localdomain ([86.57.175.117])
	by smtp.gmail.com with ESMTPSA id b3sm3238431lfq.10.2019.11.25.01.17.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 25 Nov 2019 01:17:33 -0800 (PST)
Received: by box.localdomain (Postfix, from userid 1000)
	id E895C1032C4; Mon, 25 Nov 2019 12:17:41 +0300 (+03)
Date: Mon, 25 Nov 2019 12:17:41 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20191125091741.firh7stqcpniwvga@box>
References: <20191122235324.17245-1-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191122235324.17245-1-agruenba@redhat.com>
User-Agent: NeoMutt/20180716
X-MC-Unique: 9JxdEVKdOHG2Ns1Ifu0imw-1
X-MC-Unique: xCWMlD3FNj686HFGgc4mhA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAP9HfVA008599
X-loop: cluster-devel@redhat.com
Cc: Steve French <sfrench@samba.org>,
	Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
	linux-kernel@vger.kernel.org,
	Ronnie Sahlberg <lsahlber@redhat.com>, cluster-devel@redhat.com,
	linux-mm@kvack.org, Alexander Viro <viro@zeniv.linux.org.uk>,
	Johannes Weiner <hannes@cmpxchg.org>, linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [Cluster-devel] [RFC PATCH 0/3] Rework the gfs2 read and page
	fault locking
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Sat, Nov 23, 2019 at 12:53:21AM +0100, Andreas Gruenbacher wrote:
> Hello,
>=20
> this patch series moves the glock lock taking in gfs2 from the
> ->readpage and ->readpages inode operations to the ->read_iter file and
> ->fault vm operations.  To achieve that, we add flags to the
> generic_file_read_iter and filemap_fault generic helpers.
>=20
> This proposal was triggered by the following discussion:
>=20
> https://lore.kernel.org/linux-fsdevel/157225677483.3442.42271932904863053=
30.stgit@buzz/
>=20
> In that thread, Linus argued that filesystems should make sure the inode
> size is sufficiently up-to-date before calling the generic helpers, and
> that filesystems can do it themselves if they want more than that.
> That's surely doable.  However, implementing those operations properly
> at the filesystem level quickly becomes complicated when it gets to
> things like readahead.  In addition, those slightly modified copies of
> those helpers would surely diverge from their originals over time, and
> maintaining them properly would become hard.  So I hope the relatively
> small changes to make the original helpers slightly more flexible will
> be acceptable instead.
>=20
> With the IOCB_CACHED flag added by one of the patches in this series,
> the code that Konstantin's initial patch adds to
> generic_file_buffered_read could be made conditional on the IOCB_CACHED
> flag being cleared.  That way, it won't misfire on filesystems that
> allow a stale inode size.  (I'm not sure if any filesystems other than
> gfs2 are actually affected.)
>=20
> Some additional explanation:
>=20
> The cache consistency model of filesystems like gfs2 is such that if
> pages are found in an inode's address space, those pages as well as the
> inode size are up to date and can be used without taking any filesystem
> locks.  If a page is not cached, filesystem locks must be taken before
> the page can be read; this will also bring the inode size up to date.
>=20
> Thus far, gfs2 has taken the filesystem locks inside the ->readpage and
> ->readpages address space operations.  A better approach seems to be to
> take those locks earlier, in the ->read_iter file and ->fault vm
> operations.  This would also avoid a lock inversion in ->readpages.
>=20
> We obviously want to avoid taking the filesystem locks unnecessarily
> when the pages we are looking for are already cached; otherwise, we
> would cripple performance.  So we need to check if those pages are
> present first.  That's actually exactly what the generic_file_read_iter
> and filemap_fault helpers do already anyway, except that they will call
> into ->readpage and ->readpages when they find pages missing.  Instead
> of that, we'd like those helpers to return with an error code that
> allows us to retry the operation after taking the filesystem locks.

Do you see IOCB_CACHED/FAULT_FLAG_CACHED semantics being usable for
anyting beyond gfs2?

--=20
 Kirill A. Shutemov


