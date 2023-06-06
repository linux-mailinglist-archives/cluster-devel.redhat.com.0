Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 35419724343
	for <lists+cluster-devel@lfdr.de>; Tue,  6 Jun 2023 14:55:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686056157;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=K+8gN3mys4shi44Ntk5Z6kfGgYi/MZwn+Sx3ui4XedQ=;
	b=ca1YONi1MG45DPRHD6kZP3yqBRm7AsppXdVPjbgPdEK3u7G3CiHwy2FO+iUUURw9hamaB7
	H0qcH1AguOHQtby2Ic0GOVUgVQ2VGjXx+lAL0f6uxrzdHSKcUiOpLJYtRQ5/IkpRvSzq3E
	MetA5k0W1klleFzakvf+3hZixRBTdFU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-l28qTFdUOMmSdLLzndosIg-1; Tue, 06 Jun 2023 08:55:54 -0400
X-MC-Unique: l28qTFdUOMmSdLLzndosIg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 994BA3C0ED52;
	Tue,  6 Jun 2023 12:55:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 88CCD4087C62;
	Tue,  6 Jun 2023 12:55:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3A36019466DF;
	Tue,  6 Jun 2023 12:55:42 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3A1DE19465BA for <cluster-devel@listman.corp.redhat.com>;
 Tue,  6 Jun 2023 12:55:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1813D2026D6A; Tue,  6 Jun 2023 12:55:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 106812026D49
 for <cluster-devel@redhat.com>; Tue,  6 Jun 2023 12:55:41 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1285800BFF
 for <cluster-devel@redhat.com>; Tue,  6 Jun 2023 12:55:40 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-QKxvT6atO1S5yY0yr1i74g-1; Tue, 06 Jun 2023 08:55:39 -0400
X-MC-Unique: QKxvT6atO1S5yY0yr1i74g-1
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-9745ba45cd1so769076966b.1
 for <cluster-devel@redhat.com>; Tue, 06 Jun 2023 05:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686056138; x=1688648138;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K+8gN3mys4shi44Ntk5Z6kfGgYi/MZwn+Sx3ui4XedQ=;
 b=Hn0F72D+3c9F8Tnn7sB+wJu2prqASEp+BS/dvsRa195tY8YR8PhacyosQPN8aOkjQI
 +ZlbH0xFaS/vpm/6fQ+33PP3ViaaRAIC9oYCvUskPj6ElGLvQtg6bVX8iz0w7Q8SjDks
 GvcRHPYqf2hf0m2k2w3hYprceuzuGWl5rfdKJbFChVjLqERetlRPpdhJopPkND/Emtu0
 uVluONqwJYtOgQQNNUtjaDxYTLwG+hFk6jooUCRQq9v/aGZbqvfM1nCuMQLWOOUY0KbZ
 eit93q5wNnf9z1DwILlLS5cc7d3a2bR9SSmTdqReXpJrzQHlKGp8gYxBhuN7Q46cNFcM
 jhHg==
X-Gm-Message-State: AC+VfDxZU4N7Sjq6OL+5OI1xmtVGYuS7LMlZlozlqtZ0OX3uQQUt2dGM
 xPRTQGUwH5nYk3810PJLAiHXFQMQZ3TvnbO2i1gIHarB
X-Google-Smtp-Source: ACHHUZ6CWVFIyAGB7eW65C8hbY/vxzqnq22+gMF8eMWzwxWPUB2IOdf27ELWvUOk2C6tPWtmM0QeUQ==
X-Received: by 2002:a17:907:1ca3:b0:973:f72f:dfac with SMTP id
 nb35-20020a1709071ca300b00973f72fdfacmr2487849ejc.67.1686056137695; 
 Tue, 06 Jun 2023 05:55:37 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com.
 [209.85.208.52]) by smtp.gmail.com with ESMTPSA id
 r9-20020a056402018900b0051056dc47e0sm5164240edv.8.2023.06.06.05.55.37
 for <cluster-devel@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 05:55:37 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5149bdb59daso8496564a12.2
 for <cluster-devel@redhat.com>; Tue, 06 Jun 2023 05:55:37 -0700 (PDT)
X-Received: by 2002:aa7:de9a:0:b0:510:ee0f:1eab with SMTP id
 j26-20020aa7de9a000000b00510ee0f1eabmr1797750edv.41.1686056136935; Tue, 06
 Jun 2023 05:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230606124800.1151665-1-agruenba@redhat.com>
In-Reply-To: <20230606124800.1151665-1-agruenba@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 6 Jun 2023 05:55:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi_P4tOWCbZYo11u5vbB+tTxCSGwKC9m71y-QdbZP8zKA@mail.gmail.com>
Message-ID: <CAHk-=wi_P4tOWCbZYo11u5vbB+tTxCSGwKC9m71y-QdbZP8zKA@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] [GIT PULL] gfs2 fix
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 6, 2023 at 5:48=E2=80=AFAM Andreas Gruenbacher <agruenba@redhat=
.com> wrote:
>
> - Don't get stuck writing page onto itself under direct I/O.

Btw, is there a test for this DIO case?

We've had the deadlock issue on t page lock (or for inode locks or
whatever) for normal IO when faulting in the same page that is written
to, and we have as pattern for solving that and I think there are
filesystem tests that trigger this.

But the DIO pattern is a bit different, with the whole "invalidate
page cache: issue, and the fact that you send this patch now (rather
than years ago) makes me wonder about test coverage for this all?

                Linus

