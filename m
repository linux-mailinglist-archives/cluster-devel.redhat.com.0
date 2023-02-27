Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D39636A4437
	for <lists+cluster-devel@lfdr.de>; Mon, 27 Feb 2023 15:21:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677507682;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vjb2dwtbVE3rk4u4J5ONSAlsQDeQ1QrKpm+ORZ2V9Qk=;
	b=hI/0jlyxFv/Tl8ez2BNF7hM1XwmFzOv8egD6XNq8dwynprWI4esJdMUc9ch8/bUwrHaklg
	LNasMyeT59v1sTovh5SABCsou+d0NQVXCwhbWJsd5InLcJQpwV4wBlVfOCmqMpnvnZ3HZR
	FvsORcLCzecrqylLfbxjbukRkpZ0CEo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-9dg5KHjBMKq2wMtrQTG_ZQ-1; Mon, 27 Feb 2023 09:21:18 -0500
X-MC-Unique: 9dg5KHjBMKq2wMtrQTG_ZQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9446185A7A4;
	Mon, 27 Feb 2023 14:21:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 48862492B0E;
	Mon, 27 Feb 2023 14:21:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E6A591946597;
	Mon, 27 Feb 2023 14:21:00 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 993DB1946586 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 27 Feb 2023 14:20:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 637F4492B13; Mon, 27 Feb 2023 14:20:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CC53492B12
 for <cluster-devel@redhat.com>; Mon, 27 Feb 2023 14:20:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41B13800B23
 for <cluster-devel@redhat.com>; Mon, 27 Feb 2023 14:20:44 +0000 (UTC)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-401-K8BGnlt6MyGoITZoMKS9Lg-1; Mon, 27 Feb 2023 09:20:39 -0500
X-MC-Unique: K8BGnlt6MyGoITZoMKS9Lg-1
Received: by mail-ed1-f71.google.com with SMTP id
 cz22-20020a0564021cb600b004a245f58006so8901081edb.12
 for <cluster-devel@redhat.com>; Mon, 27 Feb 2023 06:20:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vjb2dwtbVE3rk4u4J5ONSAlsQDeQ1QrKpm+ORZ2V9Qk=;
 b=L4ZNOVi551KHGzqPvdTfHLzFxcmZpbnluEUmqTDIjWq6TVvRLA5P+WPFTCpS8Hoe+W
 dpkJ+O8OEUAASf8oJNgsPAHlpJVAjoFMMfWuS0S6XI1N9ddmjTxUHkrTjmLA0ixS3noL
 qhFJjO8UvTsvkuPruJx5SscG4XyV5in9vH2sfvo+Pcj4BKTJMr9Ir9f6BUEQOkF4xbro
 Ie5A2bsHizC+1wdX26O8SjpDGGA63ohbfKzBE1UXf0OdlO5QvnNN5Dc2MUwfpHdC/1Um
 SaIbo7fbV4v6hY/LjJ8oT98XhLC8zwPHQb5qaU4Las0S0xEvAIpzvWLdvfhOIwojxig1
 mfSQ==
X-Gm-Message-State: AO0yUKV/FljO+OHn5m7d74q1rC2fLXw7B56s2g855bpjnz4R0ssAG5dj
 dym1noyxnSY7nLyz52h0O2YeIG4dnpMeDxO9hBq3yOXthSJOo9SnpPbXUO1XPw7rL717zT2DPil
 5OV5Bp7I34xRiGrQxUY/6fQJAmJ0tg2HkwDf7Sp2pW/GtMA==
X-Received: by 2002:a50:c301:0:b0:4af:5aa1:6f4e with SMTP id
 a1-20020a50c301000000b004af5aa16f4emr9588831edb.6.1677507638241; 
 Mon, 27 Feb 2023 06:20:38 -0800 (PST)
X-Google-Smtp-Source: AK7set9Uzu6Eiq21m7Z1m0q+5/vKfkGGmmJ2IswqiA0P1wXEgKMzSO9GibOPaVGB26Y59cLfF1WCz+g4wx08S0o6kic=
X-Received: by 2002:a50:c301:0:b0:4af:5aa1:6f4e with SMTP id
 a1-20020a50c301000000b004af5aa16f4emr9588821edb.6.1677507637953; Mon, 27 Feb
 2023 06:20:37 -0800 (PST)
MIME-Version: 1.0
References: <20230221214014.871804-1-aahringo@redhat.com>
In-Reply-To: <20230221214014.871804-1-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 27 Feb 2023 09:20:26 -0500
Message-ID: <CAK-6q+hx=k0F2g_85zvmwcYYvfwq9TaGc5gi63jRo+kfgRizJQ@mail.gmail.com>
To: teigland@redhat.com
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH dlm/next 0/6] fs: dlm: pending dlm
 patches
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 21, 2023 at 4:40=E2=80=AFPM Alexander Aring <aahringo@redhat.co=
m> wrote:
>
> Hi,
>
> this patch-series contains all pending patches and should be able to
> apply on the next -rc1 release. I added a patch to this series to remove
> the deprecated API code parts. Also I changed a little bit the commit
> message from "Edwin T=C3=B6r=C3=B6k" to remove some "|" and white space a=
t the end
> of the line.
>
> - Alex
>
>
> Alexander Aring (5):
>   fs: dlm: add unbound flag to dlm_io workqueue
>   fs: dlm: fix DLM_IFL_CB_PENDING gets overwritten
>   fs: dlm: move internal non shared flags to bitops
>   fs: dlm: remove DLM_IFL_STUB_MS flag

I am working on a better approach here to mostly leave all internal
flags (except ORPHAN/USER) inside the lkb->flags (or iflags how it
will be named now) so debugfs will still report the most values at the
same bit numbers. I said "mostly" because ORPHAN/USER are special here
and will be moved to a new value "sflags" meaning "shared flags" which
are used in m_flags dlm message. Some time later we can reuse all
lkb->iflags positions to give them a new meaning, this should somehow
prepare for a better transition state.

- Alex

