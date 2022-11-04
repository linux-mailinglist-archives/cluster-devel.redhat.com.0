Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4328D619F3B
	for <lists+cluster-devel@lfdr.de>; Fri,  4 Nov 2022 18:51:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667584260;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=WCtW6Z0aIHoHYYkUcnKPD24UVWnFrm8fe3F2Ogq9ddY=;
	b=d5Lw92EP9gth3EhMgiPebFSQ6zqN5j0Me3m3Pwtn3D6gFKE94yRgDvQJQ2bFig3oNpkJpV
	Vc4gmMBWrd94mgvKMaiQfdPSnhBPQ1ogNiwPn+A+vQfxSf/MV1YRSMf8FsjeIfyfB0HC4M
	0v10lQ9HIGnZIEihxLnmrepizJNmdDs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-qZ1U3bwwPeSPF6JQ3kgUkw-1; Fri, 04 Nov 2022 13:50:57 -0400
X-MC-Unique: qZ1U3bwwPeSPF6JQ3kgUkw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04A4B185A7AA;
	Fri,  4 Nov 2022 17:50:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BC52B4A9257;
	Fri,  4 Nov 2022 17:50:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2F26D1946594;
	Fri,  4 Nov 2022 17:50:54 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B2CDD1946586 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  4 Nov 2022 17:50:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 607FC40C83F0; Fri,  4 Nov 2022 17:50:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5946D40C83EC
 for <cluster-devel@redhat.com>; Fri,  4 Nov 2022 17:50:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B1493C0F42E
 for <cluster-devel@redhat.com>; Fri,  4 Nov 2022 17:50:52 +0000 (UTC)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-138-n7RBCJ00NcWuQs5Zg_fU9g-1; Fri, 04 Nov 2022 13:50:51 -0400
X-MC-Unique: n7RBCJ00NcWuQs5Zg_fU9g-1
Received: by mail-ej1-f69.google.com with SMTP id
 jg27-20020a170907971b00b007ad9892f5f6so3771526ejc.7
 for <cluster-devel@redhat.com>; Fri, 04 Nov 2022 10:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WCtW6Z0aIHoHYYkUcnKPD24UVWnFrm8fe3F2Ogq9ddY=;
 b=NgyiQq0P877wKKUoYQ96QLuEv5YAkXahgN4MHuRZq5MPiPNrcvu5zvKS1xHhEFByRY
 5BwZ1FMns5jiEXsqQy5cEWxtZ0+A3xF0QcAEaZxLZslf8RTzoWrMWv9h7/UBxKjEPi7K
 7uXqPUyHd+MhM1TfFHECRakiFsvCvshLYWW9QE/YzWYUokQsnh5raQJEYpQFzoNyDVmg
 8fzvSYTNuAa/+7hVuld5Gv8EKLf6bXpABX2Fj25TW3PbgkYMQRsddR+2pQC6b57C0SxS
 Yj3eZuRa7pY6OUIoSUY1m1qj1jiYrdx+vgIeAny3XfkHmXvtLlDa5Ris3g8PYAUiOC4i
 OigQ==
X-Gm-Message-State: ACrzQf2Hq2aJWnrpAII7fi7QnVv0r2SXsaxqdAbeNYOnfYUdgdumh4ZK
 LBhIP4fGgOiP79WzJjUClRbNJ/u0fT6TtPmVaBgu5nrGKnsoFXpOITY/0abEFZgkDmYj3qwFBMi
 eiBaRREx++wL7pJgPKqGVKlVz4j9mqEg3IdfyOw==
X-Received: by 2002:a05:6402:5409:b0:44f:1e05:1e8 with SMTP id
 ev9-20020a056402540900b0044f1e0501e8mr37092974edb.373.1667584249903; 
 Fri, 04 Nov 2022 10:50:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7PyQYtc1pZF9HFgpahtxyPNMIaDnM0gYNhb8bkIf8av1uiWhRAbIvVtBduhQj1LzYg429/mQQkHsACEIwKVNE=
X-Received: by 2002:a05:6402:5409:b0:44f:1e05:1e8 with SMTP id
 ev9-20020a056402540900b0044f1e0501e8mr37092959edb.373.1667584249716; Fri, 04
 Nov 2022 10:50:49 -0700 (PDT)
MIME-Version: 1.0
References: <202210111305.743F591@keescook> <Y0XQsqdRzlrSpgOh@mail.google.com>
 <Y2ScZqWnJKe7J6NR@mail.google.com>
In-Reply-To: <Y2ScZqWnJKe7J6NR@mail.google.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Fri, 4 Nov 2022 13:50:38 -0400
Message-ID: <CAK-6q+g37Ycmn5Etbj9Pk9iZXGCdyYc9pH18jowiS1DtTqp_EA@mail.gmail.com>
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [PATCH v5] [next] dlm: replace one-element
 array with fixed size array
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, Nov 4, 2022 at 1:00 AM Paulo Miguel Almeida
<paulo.miguel.almeida.rodenas@gmail.com> wrote:
>
> On Wed, Oct 12, 2022 at 09:23:14AM +1300, Paulo Miguel Almeida wrote:
> > One-element arrays are deprecated. So, replace one-element array with
> > fixed size array member in struct dlm_ls, and refactor the rest of the
> > code, accordingly.
> >
> > Link: https://github.com/KSPP/linux/issues/79
> > Link: https://github.com/KSPP/linux/issues/228
> > Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101836
> > Link: https://lore.kernel.org/lkml/Y0W5jkiXUkpNl4ap@mail.google.com/
> >
> > Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
> > ---
> > Changelog:
> >
> > v5: use preferred sizeof style. Req: Gustavo Silva
> > v4: resend patch using the right version number. Req: Gustavo Silva
> > v3: replace one-element array with a fixed size array. Req: Kees Cook
> > v2: patch resent as I had an issue with a <CRLF> char in my mail client
> > v1: https://lore.kernel.org/lkml/Y0ICbf8tCtXMn+W0@mail.google.com/
> > ---
> >
> >  fs/dlm/dlm_internal.h | 2 +-
> >  fs/dlm/lockspace.c    | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
> > index e34c3d2639a5..94fadb619ba0 100644
> > --- a/fs/dlm/dlm_internal.h
> > +++ b/fs/dlm/dlm_internal.h
> > @@ -670,7 +670,7 @@ struct dlm_ls {
> >       void                    *ls_ops_arg;
> >
> >       int                     ls_namelen;
> > -     char                    ls_name[1];
> > +     char                    ls_name[DLM_LOCKSPACE_LEN + 1];
> >  };
> >
> >  /*
> > diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
> > index bae050df7abf..9479c8110979 100644
> > --- a/fs/dlm/lockspace.c
> > +++ b/fs/dlm/lockspace.c
> > @@ -473,7 +473,7 @@ static int new_lockspace(const char *name, const char *cluster,
> >
> >       error = -ENOMEM;
> >
> > -     ls = kzalloc(sizeof(struct dlm_ls) + namelen, GFP_NOFS);
> > +     ls = kzalloc(sizeof(*ls), GFP_NOFS);
> >       if (!ls)
> >               goto out;
> >       memcpy(ls->ls_name, name, namelen);
> > --
> > 2.37.3
> >
>
> Christine, David,
>
> Just following up on this patch. Is there anything that either of you
> want me change for this patch to be merged?
>

I think it's fine. I am working on DLM and the current upstream
process is more per release where I resend a huge patch-series to get
it upstream into dlm/next based on a recent rc... It just takes time.
Then your patch will of course be applied on.

- Alex

