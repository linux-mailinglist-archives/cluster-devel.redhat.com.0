Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A1D752638
	for <lists+cluster-devel@lfdr.de>; Thu, 13 Jul 2023 17:09:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689260969;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KUgYgb2kelZk4GMT/95PCqHyBSGLmhKOYdEGCv/xiFc=;
	b=eTmmlFCaMHix2jrpqc+FWcfHsfsBIrfKJhn3NxdYRTCE+Xs4+Dicr4oX8cfww8IAPobL9m
	GERlNWuUY5/zYXCSZ7a9kFtNdpkpOvCY9gl05DDOBtGOgYf8W0c6b7z7SQccrN8EYXlb2w
	BUwGz55KFZXTJtnQvmJ0fRon8APpbo8=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208-GpqwYlzOO9OQA36nkdarIg-1; Thu, 13 Jul 2023 11:09:26 -0400
X-MC-Unique: GpqwYlzOO9OQA36nkdarIg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 500B23C11A1D;
	Thu, 13 Jul 2023 15:09:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4B194C1ED97;
	Thu, 13 Jul 2023 15:09:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CC21E19465B6;
	Thu, 13 Jul 2023 15:09:10 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F265119465A0 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 13 Jul 2023 15:08:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6C286F66DB; Thu, 13 Jul 2023 15:08:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 647FEF66CB
 for <cluster-devel@redhat.com>; Thu, 13 Jul 2023 15:08:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43154185A7A3
 for <cluster-devel@redhat.com>; Thu, 13 Jul 2023 15:08:39 +0000 (UTC)
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-RjrRKo_HPBaC7jzLJ81W2g-1; Thu, 13 Jul 2023 11:08:37 -0400
X-MC-Unique: RjrRKo_HPBaC7jzLJ81W2g-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-5704995f964so6744267b3.2
 for <cluster-devel@redhat.com>; Thu, 13 Jul 2023 08:08:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689260917; x=1691852917;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KUgYgb2kelZk4GMT/95PCqHyBSGLmhKOYdEGCv/xiFc=;
 b=Z+OawTmHBcK3FlPyqXMB1KF6RjP5EGsFLMEccDC4bqIQPVL+4R5Jes1uX8GJZ4NS41
 Aef3QWL2Y4M0wB+3uBw+k6KjyG2B34JO3xaDJUPmSu4RBLOj2P9RN/Zdv8s8OuhxIDOJ
 muo5dTeoKLi2mHxbcZteers64KrnZK4GFuuqRxXvTUtNDJDwG2PdV37FRYjskxxXC0Ye
 oRauaoGXbBxscvXx2yixOBboU2FRZJdVfwCyhGkqQzYfLSu8o0Jy59xEc3KufgmsYmN9
 /Uq95cA3Y3rYovMbbwvc2OzWUbJVt3nyaLbNu7KWq8l7GgV6ZHioumtv5X6/0SK7tcLe
 dGhQ==
X-Gm-Message-State: ABy/qLYRNijiA7AwbJzjn2v6YxUS0xaPEzE+jFgXEMpiQD7sKdUyFqUW
 4YSLRS+IyPDZYjQ0mzB0gG4pvI0H4+LZIYOIVOtcCOY3FmovYAXjpXwp5uYnk0Q6rPa48CV2QUZ
 vbC6mKIAlLitlrqO4OjmlZHHR2MUvP7MycbrLgQ==
X-Received: by 2002:a0d:cc0d:0:b0:57a:871e:f625 with SMTP id
 o13-20020a0dcc0d000000b0057a871ef625mr1654528ywd.52.1689260917019; 
 Thu, 13 Jul 2023 08:08:37 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGa8K3WaWqcPe8Ly0B6ohpLfdodb/c6erPOkdw7bYaYKSEpdRc5ofooc51mKzjcw9bVDlvx/r1I3iURGwngHyQ=
X-Received: by 2002:a0d:cc0d:0:b0:57a:871e:f625 with SMTP id
 o13-20020a0dcc0d000000b0057a871ef625mr1654512ywd.52.1689260916780; Thu, 13
 Jul 2023 08:08:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230713144029.3342637-1-aahringo@redhat.com>
 <2023071318-traffic-impeding-dc64@gregkh>
 <CAK-6q+j+vQL7nPnr==ZzgWfVoV9idX6k2OT0R_1DJ_qJo4J6mw@mail.gmail.com>
In-Reply-To: <CAK-6q+j+vQL7nPnr==ZzgWfVoV9idX6k2OT0R_1DJ_qJo4J6mw@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Thu, 13 Jul 2023 11:08:25 -0400
Message-ID: <CAK-6q+g1mpJBjYTN7+BH-XnrkjWzNTAFf8ydydjRQO5+aRVSag@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH v6.5-rc1 1/2] fs: dlm: introduce
 DLM_PLOCK_FL_NO_REPLY flag
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
Cc: cluster-devel@redhat.com, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 13, 2023 at 10:57=E2=80=AFAM Alexander Aring <aahringo@redhat.c=
om> wrote:
>
> Hi,
>
> On Thu, Jul 13, 2023 at 10:49=E2=80=AFAM Greg KH <gregkh@linuxfoundation.=
org> wrote:
> >
> > On Thu, Jul 13, 2023 at 10:40:28AM -0400, Alexander Aring wrote:
> > > This patch introduces a new flag DLM_PLOCK_FL_NO_REPLY in case an dlm
> > > plock operation should not send a reply back. Currently this is kind =
of
> > > being handled in DLM_PLOCK_FL_CLOSE, but DLM_PLOCK_FL_CLOSE has more
> > > meanings that it will remove all waiters for a specific nodeid/owner
> > > values in by doing a unlock operation. In case of an error in dlm use=
r
> > > space software e.g. dlm_controld we get an reply with an error back.
> > > This cannot be matched because there is no op to match in recv_list. =
We
> > > filter now on DLM_PLOCK_FL_NO_REPLY in case we had an error back as
> > > reply. In newer dlm_controld version it will never send a result back
> > > when DLM_PLOCK_FL_NO_REPLY is set. This filter is a workaround to han=
dle
> > > older dlm_controld versions.
> > >
> > > Fixes: 901025d2f319 ("dlm: make plock operation killable")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Alexander Aring <aahringo@redhat.com>
> >
> > Why is adding a new uapi a stable patch?
> >
>
> because the user space is just to copy the flags back to the kernel. I
> thought it would work. :)
>

* Speaking of dlm_controld here, we don't know any other
implementation which uses this UAPI. If there is another user space
application using it and does a different behaviour then this issue is
unfixable, as we don't know what behaviour we get there.

- Alex

