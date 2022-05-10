Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DB952201D
	for <lists+cluster-devel@lfdr.de>; Tue, 10 May 2022 17:51:47 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-326-nM0qB4rnNGKOve5pG8_Q7A-1; Tue, 10 May 2022 11:51:43 -0400
X-MC-Unique: nM0qB4rnNGKOve5pG8_Q7A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1BF1299E74A;
	Tue, 10 May 2022 15:51:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 564497C2F;
	Tue, 10 May 2022 15:51:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D8F10194705D;
	Tue, 10 May 2022 15:51:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C1C40194704D for <cluster-devel@listman.corp.redhat.com>;
 Tue, 10 May 2022 15:51:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8FAE215230AA; Tue, 10 May 2022 15:51:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BB7915230A1
 for <cluster-devel@redhat.com>; Tue, 10 May 2022 15:51:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E368D18E526E
 for <cluster-devel@redhat.com>; Tue, 10 May 2022 15:51:37 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-qY01ttZKOAGJCzlaGgHzJQ-1; Tue, 10 May 2022 11:51:36 -0400
X-MC-Unique: qY01ttZKOAGJCzlaGgHzJQ-1
Received: by mail-pl1-f173.google.com with SMTP id c9so16410493plh.2
 for <cluster-devel@redhat.com>; Tue, 10 May 2022 08:51:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PqrBku7yWCns4CXdaKkexOpRPKx78T35A2SXeO5Nj2E=;
 b=JNTRn4eBIK+50hvxQu945bPhHcbHaMNdTkAon+PK67xhG9UsPbsu3we8i/lH8/uXo2
 scSmlMDNMW5PCY3Y+kh9Utn1dvqw2bZ9QNQa1F7yFs8MsbZaZUtkkYtRHmJtIaVDyB2t
 aWH7LWZK4MziogpT3/mDWNp9qqUUCbQGhtDiDo6ph885leFMMOZZR0flia9ASfFfPh43
 o6ULDrFnTTVuK6Zqq954lsS3t339QwujRs2DHUTjT6FStz8XjXuekQljEc5WsNaHsES4
 AlJsYbvcKfDpxJNQNX+dONVljIdkP2ETnrxjUerfPgHAqR5e8Flk6beuw0iMoCJzaxe9
 4QDw==
X-Gm-Message-State: AOAM533d8pWgu1rfvfPzZURZzKJ6/YGOgRUcnpOnkkJh4HVZ81PYavA2
 necp1vurn9UxMAKNz7QO+bOWcQ==
X-Google-Smtp-Source: ABdhPJybt3dgYr6zy6CHWp80A2YhHDeIy7tSmCq53SNr13/QWthE/HGjzW3UCKvVi/6K+DIgnBx5KQ==
X-Received: by 2002:a17:902:b412:b0:15e:dc07:4c14 with SMTP id
 x18-20020a170902b41200b0015edc074c14mr21368892plr.99.1652197895085; 
 Tue, 10 May 2022 08:51:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 67-20020a621946000000b0050dc7628190sm10963364pfz.106.2022.05.10.08.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 08:51:34 -0700 (PDT)
Date: Tue, 10 May 2022 08:51:34 -0700
From: Kees Cook <keescook@chromium.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <202205100851.663310B@keescook>
References: <20220508100630.2642320-1-keescook@chromium.org>
 <YnoQmuPgK9c5V8ZC@infradead.org>
 <CAHc6FU5VfS9yNe0yH_sfOt04rvii6T_NMq7kp+32HZa5XQDtEA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHc6FU5VfS9yNe0yH_sfOt04rvii6T_NMq7kp+32HZa5XQDtEA@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
Cc: Nathan Chancellor <nathan@kernel.org>,
 cluster-devel <cluster-devel@redhat.com>, kernel test robot <lkp@intel.com>,
 Tom Rix <trix@redhat.com>, Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Bill Wendling <morbo@google.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 10, 2022 at 01:13:31PM +0200, Andreas Gruenbacher wrote:
> Kees and Christoph,
> 
> thanks for the patch and review.
> 
> On Tue, May 10, 2022 at 9:29 AM Christoph Hellwig <hch@infradead.org> wrote:
> > > +/* gfs2_glock_get(), "glock" must be first. */
> > > +struct glock_aspace {
> > > +     struct gfs2_glock       glock;
> > > +     struct address_space    mapping;
> > > +};
> >
> > Why does glock need to be first?  The whole point of using container_of
> > is that we don't have to make that assumption.
> 
> Just needs to be cleaned up in gfs2_glock_get() and
> gfs2_glock_dealloc() as well. I'll do that when applying the patch.
> 
> > >  static inline struct address_space *gfs2_glock2aspace(struct gfs2_glock *gl)
> > >  {
> > >       if (gl->gl_ops->go_flags & GLOF_ASPACE)
> > > -             return (struct address_space *)(gl + 1);
> > > +             return &(container_of(gl, struct glock_aspace, glock)->mapping);
> >
> > Do we even need the braces here?
> 
> Will use a local variable here, as suggested below.
> 
> > >       struct inode *inode = mapping->host;
> > >       if (mapping->a_ops == &gfs2_meta_aops)
> > > -             return (((struct gfs2_glock *)mapping) - 1)->gl_name.ln_sbd;
> > > +             return container_of(mapping, struct glock_aspace, mapping)->glock.gl_name.ln_sbd;
> >
> > A local variable would be really nice for the reader here to decompose
> > this a bit:
> >
> >                 struct glock_aspace *a =
> >                         container_of(mapping, struct glock_aspace, mapping);
> >
> >                 return a->glock.gl_name.ln_sbd;
> 
> Yes.

Thanks! So I should leave this with you to arrange, or should I send an
updated patch?

-- 
Kees Cook

