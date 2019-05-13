Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5F41BB29
	for <lists+cluster-devel@lfdr.de>; Mon, 13 May 2019 18:41:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 964D330832E3;
	Mon, 13 May 2019 16:41:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E5D1BA82;
	Mon, 13 May 2019 16:41:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AEA9741F58;
	Mon, 13 May 2019 16:41:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4DGfc6e027009 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 13 May 2019 12:41:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 576B319C7B; Mon, 13 May 2019 16:41:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51A1B19C72
	for <cluster-devel@redhat.com>; Mon, 13 May 2019 16:41:35 +0000 (UTC)
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
	[209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AA1FAD4E72
	for <cluster-devel@redhat.com>; Mon, 13 May 2019 16:41:35 +0000 (UTC)
Received: by mail-ot1-f72.google.com with SMTP id 68so700268otu.18
	for <cluster-devel@redhat.com>; Mon, 13 May 2019 09:41:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DTPzcVxKVm0Pc29DEn3cmhWP30Ec3xr80gOHbyh3pg4=;
	b=dOsdYH6J0xjeY7w9kC9y1mHXr6GKM8kdqcrgvxv/axnXXQ8U7saFgs7KjCcGqmPMB8
	Mbeba9Gd9ySnz95qar6xzRb8ZQ+b/Oax3SNv/VXbAbPxOvAfNv69FC0LLgInPdE1basY
	v19kzK+0/oy37ronuY2jRBx6OQgeouyFxJH6PaG5Ak4WZHuwJck8uV3peCvqYxz0n4DS
	IXtO8ofGHtohH5lYQ+6i+cP09ysPGqg5tdBD56QuqR0ZflHObEPL+9qAsX1ivPZ9QvzM
	0PWXL8KnpvPYRNyhES7RlYcOsCvnKPYy0aOu+DG3g12YZ9TeUf2aB0B7zsy9oCDnqtF9
	qxfg==
X-Gm-Message-State: APjAAAWX/b4xyuq8Q3PBoSFChDbxIs9CROgJBBCzZFUgUHPgQYk9N3RE
	8RSSqCmI0gfwgCOJB5C5QHRKCjKsHY9QlC0yoDVMHSc1Jo9mOy4FaTyAqjkUU7AwZsT8+KAzJvS
	hA3Zt2dhfhTuwZCW2XDnIuFLqMEhV1QyNGxkQEA==
X-Received: by 2002:a9d:4808:: with SMTP id c8mr2886670otf.316.1557765694933; 
	Mon, 13 May 2019 09:41:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxUEAOU5HMNLkjpIspTTmcgvg4drC7BA5RRkLRG+XXp7nK8EVV1nghClu0sQeMK46PxMdY+408xC4QGkKCpzJA=
X-Received: by 2002:a9d:4808:: with SMTP id c8mr2886658otf.316.1557765694735; 
	Mon, 13 May 2019 09:41:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190513033213.2468-1-tobin@kernel.org>
	<20190513071405.GF2868@kroah.com>
	<20190513103936.GA15053@eros.localdomain>
In-Reply-To: <20190513103936.GA15053@eros.localdomain>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 13 May 2019 18:41:23 +0200
Message-ID: <CAHc6FU7FCBn1CnzEjyj8W7LBu-Ths7bME2R3_GQ2ZmsFQxWEhA@mail.gmail.com>
To: "Tobin C. Harding" <me@tobin.cc>
Content-Type: text/plain; charset="UTF-8"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	cluster-devel <cluster-devel@redhat.com>,
	"Tobin C. Harding" <tobin@kernel.org>
Subject: Re: [Cluster-devel] [PATCH] gfs2: Fix error path kobject memory leak
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Mon, 13 May 2019 16:41:52 +0000 (UTC)

On Mon, 13 May 2019 at 12:40, Tobin C. Harding <me@tobin.cc> wrote:
>
> On Mon, May 13, 2019 at 09:14:05AM +0200, Greg Kroah-Hartman wrote:
> > On Mon, May 13, 2019 at 01:32:13PM +1000, Tobin C. Harding wrote:
> > > If a call to kobject_init_and_add() fails we must call kobject_put()
> > > otherwise we leak memory.
> > >
> > > Function always calls kobject_init_and_add() which always calls
> > > kobject_init().
> > >
> > > It is safe to leave object destruction up to the kobject release
> > > function and never free it manually.
> > >
> > > Remove call to kfree() and always call kobject_put() in the error path.
> > >
> > > Signed-off-by: Tobin C. Harding <tobin@kernel.org>
> > > ---
> > >
> > > Is it ok to send patches during the merge window?
> > >
> > > Applies on top of Linus' mainline tag: v5.1
> > >
> > > Happy to rebase if there are conflicts.
> > >
> > > thanks,
> > > Tobin.
> > >
> > >  fs/gfs2/sys.c | 7 +------
> > >  1 file changed, 1 insertion(+), 6 deletions(-)
> > >
> > > diff --git a/fs/gfs2/sys.c b/fs/gfs2/sys.c
> > > index 1787d295834e..98586b139386 100644
> > > --- a/fs/gfs2/sys.c
> > > +++ b/fs/gfs2/sys.c
> > > @@ -661,8 +661,6 @@ int gfs2_sys_fs_add(struct gfs2_sbd *sdp)
> > >     if (error)
> > >             goto fail_reg;
> > >
> > > -   sysfs_frees_sdp = 1; /* Freeing sdp is now done by sysfs calling
> > > -                           function gfs2_sbd_release. */
> >
> > You should also delete this variable at the top of the function, as it
> > is now only set once there and never used.
>
> Thanks, I should have gotten a compiler warning for that.  I was feeling
> so confident with my builds this morning ... pays not to get too cocky
> I suppose.
>
> > With that:
> >
> > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> Thanks, will re-spin.

Don't bother, I'll fix that up.

Thanks,
Andreas

