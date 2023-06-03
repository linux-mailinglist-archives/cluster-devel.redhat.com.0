Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D333720F04
	for <lists+cluster-devel@lfdr.de>; Sat,  3 Jun 2023 11:47:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685785635;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lpVCFUo5GMnPwvDWypDcvvGvza9lcUEE09oRJn4R2IQ=;
	b=PeCz3upQusQdhlSS3V0yHGyyh+GI1dBSFUnIwwIGZzSj5aJ85mv35LlJ3KT/bfmwqHqhpR
	fPgWc7BMFkX2lRfqrm0PyOtnYn+00IIOjZk20VZRCzHVVAn2UF0X/PHHry2HTCOkJnBneG
	glamP5NLSg+47/1YFmLTEMlF6kONi3o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-ASm3SEtyPUyEthx8RHF5LQ-1; Sat, 03 Jun 2023 05:47:10 -0400
X-MC-Unique: ASm3SEtyPUyEthx8RHF5LQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 641B03C025C5;
	Sat,  3 Jun 2023 09:47:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E7D952166B25;
	Sat,  3 Jun 2023 09:47:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 524B919465B9;
	Sat,  3 Jun 2023 09:47:07 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5291A19465A2 for <cluster-devel@listman.corp.redhat.com>;
 Sat,  3 Jun 2023 09:47:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 43C7940C6CCC; Sat,  3 Jun 2023 09:47:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D41140C6EC4
 for <cluster-devel@redhat.com>; Sat,  3 Jun 2023 09:47:06 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09ECC800159
 for <cluster-devel@redhat.com>; Sat,  3 Jun 2023 09:47:06 +0000 (UTC)
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-G0CeP605P1-xVsk-Eu5ejw-1; Sat, 03 Jun 2023 05:47:04 -0400
X-MC-Unique: G0CeP605P1-xVsk-Eu5ejw-1
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-39a869f633aso1261673b6e.1
 for <cluster-devel@redhat.com>; Sat, 03 Jun 2023 02:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685785623; x=1688377623;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lpVCFUo5GMnPwvDWypDcvvGvza9lcUEE09oRJn4R2IQ=;
 b=gOX1hlvylmcsT7reA5C8a0T6SkoF6JDWqb5HeNP3qJlL95DHGL4dtUs7LJuWu7Xcnf
 hPZ3HpJN44mmkamHLVHguM1YAFveETMot8v+6T4OOsJqZXi6RMluZyVg/QqTgRVEzQ1E
 x4ucn3cRxhEE0e3cESApIlzLmjT6gw7PQ12fh6/LH+fLBKdvOw6UFqlAxTnjs0cIrk9B
 zvDgBVgBQKjhPX4KWGg4Q6a1htMaGTLJkjJua2x/VR7YAdjznzlUnGw5fwv6PHrT/96n
 Ocdxi8i43NBjKGPwiHkXGKqruwkY5Qol1vl0SYYoXIy4vATHgFwMzCo3SVEr8Li9I/Q0
 v38g==
X-Gm-Message-State: AC+VfDwhmeqWY+u96MkyiJF3uzhNlbmscTPsJLiQTzGneC1JavLCfe38
 urQ4UtOA21KsB8vQeG3mmN6S/Vd9q6bHCOKvpwiX+fJqen/GedAdRRWpdNroXE0PcjYqB4FnxKp
 DLQoTYHC5kTDCn7lgha8OG46tnVGT48dgCZDs2A==
X-Received: by 2002:a05:6808:48b:b0:396:cd:829c with SMTP id
 z11-20020a056808048b00b0039600cd829cmr3038335oid.3.1685785623766; 
 Sat, 03 Jun 2023 02:47:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7B9jETQTaMcLjJ77KxcE0Jzos1GkS20jhQAcnVBsvLy49hL44IJNM3QrNwFq7XxjxJYaBfGb3sWSOaeXoP3IU=
X-Received: by 2002:a05:6808:48b:b0:396:cd:829c with SMTP id
 z11-20020a056808048b00b0039600cd829cmr3038323oid.3.1685785623556; Sat, 03 Jun
 2023 02:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230517032442.1135379-1-willy@infradead.org>
 <20230517032442.1135379-6-willy@infradead.org>
 <CAHc6FU6GowpTfX-MgRiqqwZZJ0r-85C9exc2pNkBkySCGUT0FA@mail.gmail.com>
 <ZGzBikVAWeXOmGQd@casper.infradead.org>
In-Reply-To: <ZGzBikVAWeXOmGQd@casper.infradead.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Sat, 3 Jun 2023 11:46:51 +0200
Message-ID: <CAHc6FU4F6nrEew=Bdgxr3hAgFq6+9JjfvRmiVH1JFy5ooaW8zA@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH 5/6] gfs2: Support ludicrously large
 folios in gfs2_trans_add_databufs()
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
Cc: Hannes Reinecke <hare@suse.com>, cluster-devel@redhat.com,
 Luis Chamberlain <mcgrof@kernel.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 23, 2023 at 3:37=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
> On Tue, May 23, 2023 at 02:46:07PM +0200, Andreas Gruenbacher wrote:
> > >  void gfs2_trans_add_databufs(struct gfs2_inode *ip, struct folio *fo=
lio,
> > > -                            unsigned int from, unsigned int len)
> > > +                            size_t from, size_t len)
> > >  {
> > >         struct buffer_head *head =3D folio_buffers(folio);
> > >         unsigned int bsize =3D head->b_size;
> >
> > This only makes sense if the to, start, and end variables in
> > gfs2_trans_add_databufs() are changed from unsigned int to size_t as
> > well.
>
> The history of this patch is that I started doing conversions from page
> -> folio in gfs2, then you came out with a very similar series.  This
> patch is the remainder after rebasing my patches on yours.  So we can
> either drop this patch or just apply it.  I wasn't making a concerted
> effort to make gfs2 support 4GB+ sized folios, it's just part of the
> conversion that I do.

Right. What do we do with these patches now, though? We probably don't
want to put them in the gfs2 tree given the buffer.c changes. Shall I
post a revised version? Will you?

> > >  extern void gfs2_trans_add_databufs(struct gfs2_inode *ip, struct fo=
lio *folio,
> > > -                                   unsigned int from, unsigned int l=
en);
> > > +                                   size_t from, size_t len);

Thanks,
Andreas

