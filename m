Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 880BB711A22
	for <lists+cluster-devel@lfdr.de>; Fri, 26 May 2023 00:25:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685053554;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=GAN3Cx1p5MyYzQJb5sHRi3vQVVygdiuaCzAmsMhMUvA=;
	b=PGN2NR12Qb12Vx4Lu5lc+1tiIRVcmE7+X4r8/eHAoFouCzylttXxw5kIxqwa5SDJ2wBk5H
	2eZk5T2Dym/Q0vvXHoSxt4GlhaRhBbhi1M/tAlkJVww6Ovgq7KIi1T8KGJXqJ+8d833lRG
	3RMmWwYjL2Cob6zJNDOt1Dzlwyhgt2c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-VT_RggaZO9OQ5niURyVZhw-1; Thu, 25 May 2023 18:25:50 -0400
X-MC-Unique: VT_RggaZO9OQ5niURyVZhw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB7C53806701;
	Thu, 25 May 2023 22:25:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 721E548205E;
	Thu, 25 May 2023 22:25:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1E46E19465B1;
	Thu, 25 May 2023 22:25:48 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E831219465A0 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 25 May 2023 22:25:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A548920296C6; Thu, 25 May 2023 22:25:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DBB3200AD47
 for <cluster-devel@redhat.com>; Thu, 25 May 2023 22:25:46 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C9203806701
 for <cluster-devel@redhat.com>; Thu, 25 May 2023 22:25:46 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-6e10Kj3rMKSlgyx66ulyDg-1; Thu, 25 May 2023 18:25:44 -0400
X-MC-Unique: 6e10Kj3rMKSlgyx66ulyDg-1
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2af1e290921so692431fa.3; 
 Thu, 25 May 2023 15:25:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685053543; x=1687645543;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GAN3Cx1p5MyYzQJb5sHRi3vQVVygdiuaCzAmsMhMUvA=;
 b=bskesBp65WdAcbXdeHQg3uHd1KLD3EFWgQYx/r9qc8Pc1N1ztpxiPbwJL9aldqvoZA
 o2uaqP9tmDZTrINtmEGwYwPZTSs/bZJ2gKTFGSTfus1NWkkovmUQJNU+IMZMC3OD/TXO
 ofRwCdH3JFY02jg2COpmanT2O+CnFMjn+sdW95dyWLcuzRiS18wgSP5KS7V50xGOShNw
 x67Z3P99srjwat4MqrJ585uvAKpvAl5QK3lbYzn5KoFvARV+p569dIKmR4qj5UvjYJeY
 hmRz4mMjBj2ET0qkz6757CLNBsyMG+EVpkx9f+lBsQRkYYbGCSOEHPfEPIjXB6anYrnK
 t4EQ==
X-Gm-Message-State: AC+VfDzIvaKEmc+enlkx4BS31pIiIYfxX4/CFLXkF+wjEQi7m/ISnwnY
 xLREeQ+DUWO9eE3B/zvhIJmzSoVedaIFsfhg9ik=
X-Google-Smtp-Source: ACHHUZ5OfQoDE18eXEchfzDFmKhoCe5IbXcKRUwu/cv5RMad8zV4eDRaJslLDqpqQjkKowHsPpaWzhKXbs/S/3x0bw4=
X-Received: by 2002:a2e:7c14:0:b0:2a8:a93d:7b41 with SMTP id
 x20-20020a2e7c14000000b002a8a93d7b41mr23093ljc.8.1685053542390; Thu, 25 May
 2023 15:25:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230509165657.1735798-1-kent.overstreet@linux.dev>
 <20230509165657.1735798-7-kent.overstreet@linux.dev>
 <20230510010737.heniyuxazlprrbd6@quack3>
 <ZFs3RYgdCeKjxYCw@moria.home.lan> <20230523133431.wwrkjtptu6vqqh5e@quack3>
 <ZGzoJLCRLk+pCKAk@infradead.org>
In-Reply-To: <ZGzoJLCRLk+pCKAk@infradead.org>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Fri, 26 May 2023 00:25:31 +0200
Message-ID: <CAHpGcML0CZ1RGkOf26iYt_tK0Ux=cfdW8d3bjMVbjXLr91cs+g@mail.gmail.com>
To: Christoph Hellwig <hch@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
Cc: dhowells@redhat.com, Jan Kara <jack@suse.cz>,
 "Darrick J . Wong" <djwong@kernel.org>,
 Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org,
 cluster-devel@redhat.com, linux-bcachefs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Kent Overstreet <kent.overstreet@gmail.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: text/plain; charset="UTF-8"

Am Di., 23. Mai 2023 um 18:28 Uhr schrieb Christoph Hellwig <hch@infradead.org>:
> On Tue, May 23, 2023 at 03:34:31PM +0200, Jan Kara wrote:
> > I've checked the code and AFAICT it is all indeed handled. BTW, I've now
> > remembered that GFS2 has dealt with the same deadlocks - b01b2d72da25
> > ("gfs2: Fix mmap + page fault deadlocks for direct I/O") - in a different
> > way (by prefaulting pages from the iter before grabbing the problematic
> > lock and then disabling page faults for the iomap_dio_rw() call). I guess
> > we should somehow unify these schemes so that we don't have two mechanisms
> > for avoiding exactly the same deadlock. Adding GFS2 guys to CC.
> >
> > Also good that you've written a fstest for this, that is definitely a useful
> > addition, although I suspect GFS2 guys added a test for this not so long
> > ago when testing their stuff. Maybe they have a pointer handy?
>
> generic/708 is the btrfs version of this.
>
> But I think all of the file systems that have this deadlock are actually
> fundamentally broken because they have a mess up locking hierarchy
> where page faults take the same lock that is held over the the direct I/
> operation.  And the right thing is to fix this.  I have work in progress
> for btrfs, and something similar should apply to gfs2, with the added
> complication that it probably means a revision to their network
> protocol.

We do disable page faults, and there can be deadlocks in page fault
handlers while no page faults are allowed.

I'm roughly aware of the locking hierarchy that other filesystems use,
and that's something we want to avoid because of two reasons: (1) it
would be an incompatible change, and (2) we want to avoid cluster-wide
locking operations as much as possible because they are very slow.

These kinds of locking conflicts are so rare in practice that the
theoretical inefficiency of having to retry the operation doesn't
matter.

> I'm absolutely not in favour to add workarounds for thes kind of locking
> problems to the core kernel.  I already feel bad for allowing the
> small workaround in iomap for btrfs, as just fixing the locking back
> then would have avoid massive ratholing.

Please let me know when those btrfs changes are in a presentable shape ...

Thanks,
Andreas

