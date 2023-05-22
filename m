Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2385770C322
	for <lists+cluster-devel@lfdr.de>; Mon, 22 May 2023 18:19:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684772368;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VJzZyuZNzPn2ke6jAQ+3bvF8maBxSbotNT8/V4Lv+Fc=;
	b=aLGdEnOGKDU/sCOPvLgxZn+ZxTMLibFbS0Vxwy3Be2Pdql8AMJKQW4S0MY9JOX2oX1mLoO
	EXZI92YMrVrUyepVVtbu7cALlVW42Ec2boF6AUUyzNBY+ErHWwh7PCbgKll3PJxUl2B5+d
	lJRM/swaRWk3zXhzylPEhD80kPU/5Oo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-yuU0bfZbOTOPNRQVNPFZxA-1; Mon, 22 May 2023 12:19:27 -0400
X-MC-Unique: yuU0bfZbOTOPNRQVNPFZxA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69843101A58B;
	Mon, 22 May 2023 16:19:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 463D1492B0B;
	Mon, 22 May 2023 16:19:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C289419465B1;
	Mon, 22 May 2023 16:19:23 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DA4E11946595 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 22 May 2023 16:19:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9A7FD1121315; Mon, 22 May 2023 16:19:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9395D1121314
 for <cluster-devel@redhat.com>; Mon, 22 May 2023 16:19:02 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7408338025F3
 for <cluster-devel@redhat.com>; Mon, 22 May 2023 16:19:02 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-bTuXlx8VNLOY8ZVgoVEMxA-1; Mon, 22 May 2023 12:18:58 -0400
X-MC-Unique: bTuXlx8VNLOY8ZVgoVEMxA-1
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3093eb8cd1fso3931752f8f.1; 
 Mon, 22 May 2023 09:18:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684772337; x=1687364337;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VJzZyuZNzPn2ke6jAQ+3bvF8maBxSbotNT8/V4Lv+Fc=;
 b=WWkfOLefoCom/jjFfkvDVs4bjO29JR7ac4b33ZABe+zbgCCGj/mDKxgdDHv6iRpwpx
 ZzAGD6ZNqeW88jgs1MkKgf4vs0l9MNCOgurKcYKRzh18B4cifJx8QImDHXgMz85mpqjN
 rW9sUK/98oMMtq67qZ4Ws3CMkODCOiQlenDwPuClCvOBZf/Mq69uJC9+Y7i9B1h7oNvt
 I3RbQOHbPMWNAnVwqe3VrrWFGP+vtplTMnR6cZ9H1ZpjU80inCMPex8i2+SjMq3CsWOD
 KELWwgubzSMjqPHptSMUkL52yEezMFhQotnuAxo6Je004r28UfODskwI/i1tgTp9Adku
 afhw==
X-Gm-Message-State: AC+VfDwiWI2wOqW0k3gjT5NPFui7iOt68Gg4q7UJLV+OjY+OTOd+cNMc
 FExStL11RXCx8L4sbSI29D9Ype/mDQRqE7BCGCE=
X-Google-Smtp-Source: ACHHUZ4kjOVYxEoor1w0hcaOXS33WeDLf0YRoOnSYzNl5ea6bGgc3qRhDbdI4pwwhHHJXH7oI9bc0NRBHiqq5OR8B9Q=
X-Received: by 2002:a5d:4b12:0:b0:309:4b55:419d with SMTP id
 v18-20020a5d4b12000000b003094b55419dmr4840129wrq.8.1684772336654; Mon, 22 May
 2023 09:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230510221237.3509484-1-azeemshaikh38@gmail.com>
 <202305110926.4A833D9@keescook>
In-Reply-To: <202305110926.4A833D9@keescook>
From: Azeem Shaikh <azeemshaikh38@gmail.com>
Date: Mon, 22 May 2023 12:18:45 -0400
Message-ID: <CADmuW3U7tFfSKrQL5TopOYnDNNiHPsC42E3ghWhpqCDtKeOSYg@mail.gmail.com>
To: Kees Cook <keescook@chromium.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [PATCH] dlm: Replace all non-returning strlcpy
 with strscpy
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
Cc: cluster-devel@redhat.com, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 11, 2023 at 12:26=E2=80=AFPM Kees Cook <keescook@chromium.org> =
wrote:
>
> On Wed, May 10, 2023 at 10:12:37PM +0000, Azeem Shaikh wrote:
> > strlcpy() reads the entire source buffer first.
> > This read may exceed the destination size limit.
> > This is both inefficient and can lead to linear read
> > overflows if a source string is not NUL-terminated [1].
> > In an effort to remove strlcpy() completely [2], replace
> > strlcpy() here with strscpy().
> > No return values were used, so direct replacement is safe.
> >
> > [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strl=
cpy
> > [2] https://github.com/KSPP/linux/issues/89
> >
> > Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
>
> --
> Kees Cook

Friendly ping on this.

