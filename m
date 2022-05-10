Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED20521358
	for <lists+cluster-devel@lfdr.de>; Tue, 10 May 2022 13:13:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652181236;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=D5QpDLvjaL/3sbIJjxhXvjRruga3nx8tizHPxU55AHk=;
	b=arF0v9ezlPbEdo7DJdE3JjonekhIdB3f8DCS8TYRmIT9Nrx1mm8JJUDdq2X/5vfXBByIbF
	YhEN/qk8LNj6vVcZY8/AVzP5TLb2+74jTixU8hrtv2a6iBpRG4qEbI/1sbihui6ay2Qe2Z
	dOxECi33mGpFqweSGg+7+fRVI2AGA2k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-13hBQ3SwMheLBgG-aBO5XA-1; Tue, 10 May 2022 07:13:52 -0400
X-MC-Unique: 13hBQ3SwMheLBgG-aBO5XA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0463101AA44;
	Tue, 10 May 2022 11:13:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4E3A1438BF5;
	Tue, 10 May 2022 11:13:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DC68B194705D;
	Tue, 10 May 2022 11:13:49 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 149D11947052 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 10 May 2022 11:13:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E5ABF414A7E9; Tue, 10 May 2022 11:13:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1B20414A7E7
 for <cluster-devel@redhat.com>; Tue, 10 May 2022 11:13:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C99F8185A7A4
 for <cluster-devel@redhat.com>; Tue, 10 May 2022 11:13:47 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-Si4P-6VIPru7XwHDjzM1Kg-1; Tue, 10 May 2022 07:13:44 -0400
X-MC-Unique: Si4P-6VIPru7XwHDjzM1Kg-1
Received: by mail-wm1-f71.google.com with SMTP id
 r186-20020a1c44c3000000b00393f52ed5ceso1120715wma.7
 for <cluster-devel@redhat.com>; Tue, 10 May 2022 04:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D5QpDLvjaL/3sbIJjxhXvjRruga3nx8tizHPxU55AHk=;
 b=rfTcHti+ar53nLPqB/ujcnT1LQM3DMpkP7BP08NMo7IWw33aZGwdepH0LShTIFSddR
 7fWErX0dyL8aEaKMK/4mKTOB9DS1EgoYFBTO2XeLdz35+0WwKx6jn7F2s08D9j29EGli
 jrRKyap1AjsRTv8SbICnxXQt23vXGhRIdYqLAv2do6LW7yB6epy3GfO3FOlGfiAoxzx0
 9wJdgBtP2C8/H/mzreT09AbeV3oVMnOH2in1ZXjnsipbRVONColOSJukYfx7QZLVJFvl
 qNgY3pb3xDYb2olsOXR2Z6SvKDd+62UlL8D+TCuqdGjE8ynk7AsuoHWy+GtIZnjEWzRS
 du0Q==
X-Gm-Message-State: AOAM530vY6lFX5C2VhndfV270wN/GvrqZfDSpjb75fOmg6GSRoOm6waK
 DL7ApfBXaTGSOo1+goKXrgabA6uHhmxPIrG1bxVgNc3K6K5rxbTPtwXcaEj/vwWfwnWLGG+2Fan
 spG676U3Xt8MZEEAMQQ0VsYWZn3Ybh/oBlRFTCQ==
X-Received: by 2002:a05:600c:501e:b0:394:8b0a:3ec9 with SMTP id
 n30-20020a05600c501e00b003948b0a3ec9mr11945147wmr.0.1652181223537; 
 Tue, 10 May 2022 04:13:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0gjbA7+3TrCagIYxdCI9NkRd7LcHVggdp1NZufK6Cnw8DV0cCzDb63Ne9hqLyNNa1u57MLcInZtEPF2ZahDw=
X-Received: by 2002:a05:600c:501e:b0:394:8b0a:3ec9 with SMTP id
 n30-20020a05600c501e00b003948b0a3ec9mr11945136wmr.0.1652181223377; Tue, 10
 May 2022 04:13:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220508100630.2642320-1-keescook@chromium.org>
 <YnoQmuPgK9c5V8ZC@infradead.org>
In-Reply-To: <YnoQmuPgK9c5V8ZC@infradead.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 10 May 2022 13:13:31 +0200
Message-ID: <CAHc6FU5VfS9yNe0yH_sfOt04rvii6T_NMq7kp+32HZa5XQDtEA@mail.gmail.com>
To: Kees Cook <keescook@chromium.org>, Christoph Hellwig <hch@infradead.org>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH] gfs2: Use container_of() for
 gfs2_glock(aspace)
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
Cc: Nathan Chancellor <nathan@kernel.org>, kernel test robot <lkp@intel.com>,
 Tom Rix <trix@redhat.com>, Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, cluster-devel <cluster-devel@redhat.com>,
 Bill Wendling <morbo@google.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Kees and Christoph,

thanks for the patch and review.

On Tue, May 10, 2022 at 9:29 AM Christoph Hellwig <hch@infradead.org> wrote:
> > +/* gfs2_glock_get(), "glock" must be first. */
> > +struct glock_aspace {
> > +     struct gfs2_glock       glock;
> > +     struct address_space    mapping;
> > +};
>
> Why does glock need to be first?  The whole point of using container_of
> is that we don't have to make that assumption.

Just needs to be cleaned up in gfs2_glock_get() and
gfs2_glock_dealloc() as well. I'll do that when applying the patch.

> >  static inline struct address_space *gfs2_glock2aspace(struct gfs2_glock *gl)
> >  {
> >       if (gl->gl_ops->go_flags & GLOF_ASPACE)
> > -             return (struct address_space *)(gl + 1);
> > +             return &(container_of(gl, struct glock_aspace, glock)->mapping);
>
> Do we even need the braces here?

Will use a local variable here, as suggested below.

> >       struct inode *inode = mapping->host;
> >       if (mapping->a_ops == &gfs2_meta_aops)
> > -             return (((struct gfs2_glock *)mapping) - 1)->gl_name.ln_sbd;
> > +             return container_of(mapping, struct glock_aspace, mapping)->glock.gl_name.ln_sbd;
>
> A local variable would be really nice for the reader here to decompose
> this a bit:
>
>                 struct glock_aspace *a =
>                         container_of(mapping, struct glock_aspace, mapping);
>
>                 return a->glock.gl_name.ln_sbd;

Yes.

Thanks,
Andreas

