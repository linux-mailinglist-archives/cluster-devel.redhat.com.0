Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FB97119F6
	for <lists+cluster-devel@lfdr.de>; Fri, 26 May 2023 00:04:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685052281;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=BsY/WgiwAnYCALQVm6Bp47qhqPyD/a7vg0rsgz10LlE=;
	b=Pxr/M7aqqgie1wV43XMF/q1gZWV+L141RtWiwiE4ae0qhnFq8MF/Ve9wIyov2bd4HqAgPe
	1ZtFEQeTwxkWcnFlHQmRYlpeEof1l50/VHOIJV9ld3VfW3aOHi0EpzlE3ALo3+MiNru9Es
	XjvWYcjbag4WuohDusVEqtnJxvV3c4s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-47KRZ86VMQSyKs3c-BZvYQ-1; Thu, 25 May 2023 18:04:37 -0400
X-MC-Unique: 47KRZ86VMQSyKs3c-BZvYQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC54C3C02573;
	Thu, 25 May 2023 22:04:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E2D5020296C6;
	Thu, 25 May 2023 22:04:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9F36719465B1;
	Thu, 25 May 2023 22:04:35 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 538CB19465A0 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 25 May 2023 22:04:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 13CC72166B2E; Thu, 25 May 2023 22:04:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AE7F2166B2B
 for <cluster-devel@redhat.com>; Thu, 25 May 2023 22:04:34 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2B52296A617
 for <cluster-devel@redhat.com>; Thu, 25 May 2023 22:04:33 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-0XwMR443MNmvwyv3I-aTCg-1; Thu, 25 May 2023 18:04:31 -0400
X-MC-Unique: 0XwMR443MNmvwyv3I-aTCg-1
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2af316b4515so586361fa.1; 
 Thu, 25 May 2023 15:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685052270; x=1687644270;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BsY/WgiwAnYCALQVm6Bp47qhqPyD/a7vg0rsgz10LlE=;
 b=F0JUA3NfgpAb+uSA9SmKqC2sHdw+VgdxtTCuVSe9ARhVtRSmwXmBj1x0lCFwTZlrRh
 Z39ZbJMhJn/e/etljIILYJwdyGIGLVVyKfFqXv0FuJEU8e+P9JUgoYVlagQ2I09/qfB9
 xAWqJZ48+XjKXe2pTjCgKJ6O9r3+whEmz0b7pidF/CEItS+0K4uEQ7qQjP05uEDT7UoV
 vkYoGx3SJZzGpC9Jg7447sKpNiubgc4cXRr6FNz4cCjUFx/WZtuSU7FPRaHhI4CmagJI
 x2tJOyx6hdidxnT7hs8xOPYoh0ACcvlYLe2p8ivRNiESo/9L7IWq2T8YWoAsvch6Zjvw
 EZ/w==
X-Gm-Message-State: AC+VfDwWa2ti/jxFvEF1XIYBl0sr0l6yeU5WOeFrFIIs4BT/rIFBt+Fg
 tjmJZOvCmfY2NDqCMaYFUjnYzotaqepG0vZAtWxUKe39sByRHQ==
X-Google-Smtp-Source: ACHHUZ6atKuSW0mxmBEyZwRwKLDLYOhQEiYiF6zIejDH2dcPtMDsGBAsJ15ONxXwAJhKNJsWeD9VDTirPe6qiM6rveg=
X-Received: by 2002:a2e:3005:0:b0:2ac:6038:ece5 with SMTP id
 w5-20020a2e3005000000b002ac6038ece5mr1292743ljw.49.1685052269350; Thu, 25 May
 2023 15:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230509165657.1735798-1-kent.overstreet@linux.dev>
 <20230509165657.1735798-7-kent.overstreet@linux.dev>
 <20230510010737.heniyuxazlprrbd6@quack3>
 <ZFs3RYgdCeKjxYCw@moria.home.lan> <20230523133431.wwrkjtptu6vqqh5e@quack3>
In-Reply-To: <20230523133431.wwrkjtptu6vqqh5e@quack3>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Fri, 26 May 2023 00:04:18 +0200
Message-ID: <CAHpGcMLdPAcFJnMii0eq=hyK2UX1L9E19wRKKp7LMr971nnL7w@mail.gmail.com>
To: Jan Kara <jack@suse.cz>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH 06/32] sched: Add
 task_struct->faults_disabled_mapping
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
Cc: cluster-devel@redhat.com, "Darrick J . Wong" <djwong@kernel.org>,
 Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org,
 dhowells@redhat.com, linux-bcachefs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Kent Overstreet <kent.overstreet@gmail.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: text/plain; charset="UTF-8"

Am Di., 23. Mai 2023 um 15:37 Uhr schrieb Jan Kara <jack@suse.cz>:
> On Wed 10-05-23 02:18:45, Kent Overstreet wrote:
> > On Wed, May 10, 2023 at 03:07:37AM +0200, Jan Kara wrote:
> > > On Tue 09-05-23 12:56:31, Kent Overstreet wrote:
> > > > From: Kent Overstreet <kent.overstreet@gmail.com>
> > > >
> > > > This is used by bcachefs to fix a page cache coherency issue with
> > > > O_DIRECT writes.
> > > >
> > > > Also relevant: mapping->invalidate_lock, see below.
> > > >
> > > > O_DIRECT writes (and other filesystem operations that modify file data
> > > > while bypassing the page cache) need to shoot down ranges of the page
> > > > cache - and additionally, need locking to prevent those pages from
> > > > pulled back in.
> > > >
> > > > But O_DIRECT writes invoke the page fault handler (via get_user_pages),
> > > > and the page fault handler will need to take that same lock - this is a
> > > > classic recursive deadlock if userspace has mmaped the file they're DIO
> > > > writing to and uses those pages for the buffer to write from, and it's a
> > > > lock ordering deadlock in general.
> > > >
> > > > Thus we need a way to signal from the dio code to the page fault handler
> > > > when we already are holding the pagecache add lock on an address space -
> > > > this patch just adds a member to task_struct for this purpose. For now
> > > > only bcachefs is implementing this locking, though it may be moved out
> > > > of bcachefs and made available to other filesystems in the future.
> > >
> > > It would be nice to have at least a link to the code that's actually using
> > > the field you are adding.
> >
> > Bit of a trick to link to a _later_ patch in the series from a commit
> > message, but...
> >
> > https://evilpiepirate.org/git/bcachefs.git/tree/fs/bcachefs/fs-io.c#n975
> > https://evilpiepirate.org/git/bcachefs.git/tree/fs/bcachefs/fs-io.c#n2454
>
> Thanks and I'm sorry for the delay.
>
> > > Also I think we were already through this discussion [1] and we ended up
> > > agreeing that your scheme actually solves only the AA deadlock but a
> > > malicious userspace can easily create AB BA deadlock by running direct IO
> > > to file A using mapped file B as a buffer *and* direct IO to file B using
> > > mapped file A as a buffer.
> >
> > No, that's definitely handled (and you can see it in the code I linked),
> > and I wrote a torture test for fstests as well.
>
> I've checked the code and AFAICT it is all indeed handled. BTW, I've now
> remembered that GFS2 has dealt with the same deadlocks - b01b2d72da25
> ("gfs2: Fix mmap + page fault deadlocks for direct I/O") - in a different
> way (by prefaulting pages from the iter before grabbing the problematic
> lock and then disabling page faults for the iomap_dio_rw() call). I guess
> we should somehow unify these schemes so that we don't have two mechanisms
> for avoiding exactly the same deadlock. Adding GFS2 guys to CC.
>
> Also good that you've written a fstest for this, that is definitely a useful
> addition, although I suspect GFS2 guys added a test for this not so long
> ago when testing their stuff. Maybe they have a pointer handy?

Ah yes, that's xfstests commit d3cbdabf ("generic: Test page faults
during read and write").

Thanks,
Andreas

>                                                                 Honza
> --
> Jan Kara <jack@suse.com>
> SUSE Labs, CR

