Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A966C332E
	for <lists+cluster-devel@lfdr.de>; Tue, 21 Mar 2023 14:47:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679406466;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0RIXpKojzqunp35JYe2wiS1vpJ0iXKCBp57if5bO+Z0=;
	b=Ni5aAXjeAfSCUD6t2/NTDZai0ZbfuW4TNgjsl3ByvyZP9/hJbcbDWJen+JTwiNQCAkSO7s
	VmPoXREo+ppKfrPHMVvhd4sP7nOfSo7PEq5Ktr7K4mYCS9AxOpiwdiW8jcQXtSyGnt6zER
	t7fYl8F76eULP92v0VlnWEdXJheJHEw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-zhclEMV6PDGhbVy3sEMtAw-1; Tue, 21 Mar 2023 09:47:42 -0400
X-MC-Unique: zhclEMV6PDGhbVy3sEMtAw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 516E985C06A;
	Tue, 21 Mar 2023 13:47:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 09E3A1410F1E;
	Tue, 21 Mar 2023 13:47:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CA19119465B3;
	Tue, 21 Mar 2023 13:47:40 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 875611946594 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 21 Mar 2023 13:47:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5BE49483EC4; Tue, 21 Mar 2023 13:47:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 54C88463DF8
 for <cluster-devel@redhat.com>; Tue, 21 Mar 2023 13:47:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3877E2806049
 for <cluster-devel@redhat.com>; Tue, 21 Mar 2023 13:47:34 +0000 (UTC)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-Pm09WxudPhecJNexEm6FVQ-1; Tue, 21 Mar 2023 09:47:32 -0400
X-MC-Unique: Pm09WxudPhecJNexEm6FVQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 m18-20020a50d7d2000000b00501dfd867a4so2126371edj.20
 for <cluster-devel@redhat.com>; Tue, 21 Mar 2023 06:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679406450;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0RIXpKojzqunp35JYe2wiS1vpJ0iXKCBp57if5bO+Z0=;
 b=ZBRMQEcbUbw+Wjl5D42DEh8PRGZhd6YYndjSmwWFoYNqukNOmi9ipT3v/MgP9M8L26
 b+K3rjcrAmzFoFleJRhidAfzfWJl0gqrqEwnaJ2S2lavqjUwTJP7VQTf81QfW02r3rQi
 JXcOd8WddlhMBfDqr1UnGcDW9YeBd87oXRAvwqKiUnbGWmVGSPf5o0Sl5humcNN551uV
 k3f8d/pMDLs+3kQsNq/Ma0r5ALtnARirA5F96xmE5mxC3em6d3QGSNtwQzWP1bYLI01K
 pryOFiY9BAhGhHg0B46IcriL/h0bI4uux9BIOiPfbj3e3aBWCRnOH3dm0b2ER0gXP7Uu
 cGpw==
X-Gm-Message-State: AO0yUKWhnhVrvO7eauubmUlWFo4WvW0dw0PR6ya8lxW0rqeuKN/6Jicm
 OtooEr/R0GOPnUNcAfG/PI/QzKA5f29Q4+ShPPDRG9tb78PqC45hj/4Sj/Hhx+GysVdYM+cbcDd
 5cCBJRUjTcqlli+ixVCSOQSuoBsbD3CV/k/JrMPu1ORCXt/uL
X-Received: by 2002:a17:906:49b:b0:931:7350:a7cd with SMTP id
 f27-20020a170906049b00b009317350a7cdmr1309113eja.9.1679406450596; 
 Tue, 21 Mar 2023 06:47:30 -0700 (PDT)
X-Google-Smtp-Source: AK7set9UtW6hB+M87aNbAnWNNK9FPRW9MYRiEXbSU8FtX2ZzcqFJFjx//CQJGolx4O6TeLXFij6kvlC3FvI+pIpzKiE=
X-Received: by 2002:a17:906:49b:b0:931:7350:a7cd with SMTP id
 f27-20020a170906049b00b009317350a7cdmr1309103eja.9.1679406450348; Tue, 21 Mar
 2023 06:47:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230321131734.2113556-1-aahringo@redhat.com>
 <CAHc6FU7-Hc7d284NihFpyyc2EByex+Nug8GVmLr0brkGS3BGmg@mail.gmail.com>
In-Reply-To: <CAHc6FU7-Hc7d284NihFpyyc2EByex+Nug8GVmLr0brkGS3BGmg@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Tue, 21 Mar 2023 09:47:18 -0400
Message-ID: <CAK-6q+gO16-jfOSRUS4bvR_cUz3=XRCk_V2Ky-Lxdn15yyRR=A@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH] dlm_controld: set posix_lock flags to
 zero
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 21, 2023 at 9:34=E2=80=AFAM Andreas Gruenbacher <agruenba@redha=
t.com> wrote:
>
> On Tue, Mar 21, 2023 at 2:17=E2=80=AFPM Alexander Aring <aahringo@redhat.=
com> wrote:
> > This patch sets another flags variable to zero which is a leftover of
> > commit 0834ed4b ("dlm_controld: initialize waiter->flags").
> > ---
> >  dlm_controld/plock.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/dlm_controld/plock.c b/dlm_controld/plock.c
> > index ad9b0f27..7f632888 100644
> > --- a/dlm_controld/plock.c
> > +++ b/dlm_controld/plock.c
> > @@ -1956,6 +1956,7 @@ void receive_plocks_data(struct lockspace *ls, st=
ruct dlm_header *hd, int len)
> >                         po->pid         =3D le32_to_cpu(pp->pid);
> >                         po->nodeid      =3D le32_to_cpu(pp->nodeid);
> >                         po->ex          =3D pp->ex;
> > +                       po->flags       =3D 0;
> >                         list_add_tail(&po->list, &r->locks);
> >                 } else {
> >                         w =3D malloc(sizeof(struct lock_waiter));
>
> ^ And I think w->flags also isn't being initialized.

I added it by changing your patch, but I only checked for
lock_waiter... After pushing those patches I found a missing piece in
posix_lock.

Meanwhile I ran cppcheck on it and it found another issue...

- Alex

