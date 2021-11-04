Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E96A445B20
	for <lists+cluster-devel@lfdr.de>; Thu,  4 Nov 2021 21:31:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636057907;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=HlUyb94lQB0YUSrmRZ31/WYJ0OQFpRSOr5iyyx2CB+I=;
	b=JLrCzJZeC1/P5TFvprBkAMYgQIjBdR/9utTfnJMR21sa0JWwkKBFpAR0uFozUdCzdtCNnH
	DMlTITD6yh+i4cUOfdnw2qtCdjAcR+gsL0V8GPXGlzsJZyu1YjzTM2eJ00OE9/TcinS8rb
	lYeXuhmBw6eJIzBu7kmBUHPriKIk8gE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-xhyJBvbeNbesJAR0UMngaA-1; Thu, 04 Nov 2021 16:31:44 -0400
X-MC-Unique: xhyJBvbeNbesJAR0UMngaA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AB789127F;
	Thu,  4 Nov 2021 20:31:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 123161009AB7;
	Thu,  4 Nov 2021 20:31:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F34294E58F;
	Thu,  4 Nov 2021 20:31:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A4KVKrY022000 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 4 Nov 2021 16:31:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D9C0140D1B9E; Thu,  4 Nov 2021 20:31:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D5E7840C1252
	for <cluster-devel@redhat.com>; Thu,  4 Nov 2021 20:31:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB56A811E76
	for <cluster-devel@redhat.com>; Thu,  4 Nov 2021 20:31:20 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
	[209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-509-lPa7prHbMlqujffi_mv_NQ-1; Thu, 04 Nov 2021 16:31:19 -0400
X-MC-Unique: lPa7prHbMlqujffi_mv_NQ-1
Received: by mail-wm1-f72.google.com with SMTP id
	j193-20020a1c23ca000000b003306ae8bfb7so2809159wmj.7
	for <cluster-devel@redhat.com>; Thu, 04 Nov 2021 13:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HlUyb94lQB0YUSrmRZ31/WYJ0OQFpRSOr5iyyx2CB+I=;
	b=R5W9cQrYk0Obn/unJSGd88QdajkU6yef6Hwma2uNaeEL4Lr3CLN2Q0yTtiFeNLrlrZ
	NyTEgdCibXt9iawJQsnMHt/ajQrv9/ytBZxMTPcp20X8YqAuVaJDI79qMC47Mh8LzW1l
	iK6Wg+2Gdi3K1jlR2lLCNB13IwunnnE6R7qdqMOjPZRk+uup3Q4tzXG6FnI4agqG1+5d
	wI6a7VjlqczbDtbJO6jsRe5Dx0MlOrxzSNP1johHG0nLZ0Rbc4wUmk8H+D790Xvdu8QH
	Yj+96cKlEd8Yz8kNwPa+YbSHt5YYaBTBXTje+VANpm+TJjE91QI8sL+g4ozBtU/3+clM
	gxPA==
X-Gm-Message-State: AOAM531UlpWBRvzds+RO633aA4swr711cHqZ9hUrrMbFRnCFX1S7eqkC
	Lr12LJsAlS+773re4Hf9RMnH8J9+y3bykAYZrb7A3uA903mH8p6hmjHtzXiQblBpBcsi2QsHzT7
	p+QfWNjuBNS1nBgGGhCdSyEsFPKXHpvZ6C5gOnQ==
X-Received: by 2002:a5d:628f:: with SMTP id k15mr55558380wru.363.1636057878439;
	Thu, 04 Nov 2021 13:31:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzy1DT2zp9sqf5BtrQx4eQL+9Qk0WkCFqWYvRSY0pAibZ7MAIDeuCyzWc0voG6eZ/QZ2qH8hnGM3VUV2a9qxnY=
X-Received: by 2002:a5d:628f:: with SMTP id k15mr55558351wru.363.1636057878260;
	Thu, 04 Nov 2021 13:31:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211102122945.117744-1-agruenba@redhat.com>
	<20211102122945.117744-5-agruenba@redhat.com>
	<YYQk9L0D57QHc0gE@arm.com>
In-Reply-To: <YYQk9L0D57QHc0gE@arm.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 4 Nov 2021 21:31:07 +0100
Message-ID: <CAHc6FU5DsC5C+aOTPX+MV+_49-V_RvyOWKNzcjoVfY=OzEVuAw@mail.gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: cluster-devel@redhat.com
Cc: kvm-ppc@vger.kernel.org, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	cluster-devel <cluster-devel@redhat.com>, joey.gouly@arm.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Paul Mackerras <paulus@ozlabs.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-btrfs <linux-btrfs@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v9 04/17] iov_iter: Turn
	iov_iter_fault_in_readable into fault_in_iov_iter_readable
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 4, 2021 at 7:22 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
> On Tue, Nov 02, 2021 at 01:29:32PM +0100, Andreas Gruenbacher wrote:
> > Turn iov_iter_fault_in_readable into a function that returns the number
> > of bytes not faulted in, similar to copy_to_user, instead of returning a
> > non-zero value when any of the requested pages couldn't be faulted in.
> > This supports the existing users that require all pages to be faulted in
> > as well as new users that are happy if any pages can be faulted in.
> >
> > Rename iov_iter_fault_in_readable to fault_in_iov_iter_readable to make
> > sure this change doesn't silently break things.
> >
> > Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> [...]
> > diff --git a/mm/filemap.c b/mm/filemap.c
> > index ff34f4087f87..4dd5edcd39fd 100644
> > --- a/mm/filemap.c
> > +++ b/mm/filemap.c
> > @@ -3757,7 +3757,7 @@ ssize_t generic_perform_write(struct file *file,
> >                * same page as we're writing to, without it being marked
> >                * up-to-date.
> >                */
> > -             if (unlikely(iov_iter_fault_in_readable(i, bytes))) {
> > +             if (unlikely(fault_in_iov_iter_readable(i, bytes))) {
> >                       status = -EFAULT;
> >                       break;
> >               }
>
> Now that fault_in_iov_iter_readable() returns the number of bytes, we
> could change the above test to:
>
>                 if (unlikely(fault_in_iov_iter_readable(i, bytes) == bytes)) {
>
> Assuming we have a pointer 'a', accessible, and 'a + PAGE_SIZE' unmapped:
>
>         write(fd, a + PAGE_SIZE - 1, 2);
>
> can still copy one byte but it returns -EFAULT instead since the second
> page is not accessible.
>
> While writing some test-cases for MTE (sub-page faults, 16-byte
> granularity), we noticed that reading 2 bytes from 'a + 15' with
> 'a + 16' tagged for faulting:
>
>         write(fd, a + 15, 2);
>
> succeeds as long as 'a + 16' is not at a page boundary. Checking against
> 'bytes' above makes this consistent.
>
> The downside is that it's an ABI change though not sure anyone is
> relying on it.

The same pattern exists in iomap_write_iter too, of course. In the
very light testing I did for eliminating the pre-faulting, this kind
of change was working fine. I have no performance numbers though.

  https://lore.kernel.org/linux-fsdevel/20211026094430.3669156-1-agruenba@redhat.com/
  https://lore.kernel.org/linux-fsdevel/20211027212138.3722977-1-agruenba@redhat.com/

Thanks,
Andreas

