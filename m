Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 39288526C5B
	for <lists+cluster-devel@lfdr.de>; Fri, 13 May 2022 23:35:42 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-jiHk-IOlM2eEJBGviWjpdA-1; Fri, 13 May 2022 17:35:36 -0400
X-MC-Unique: jiHk-IOlM2eEJBGviWjpdA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67C1F101AA45;
	Fri, 13 May 2022 21:35:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A03DC40CF8FA;
	Fri, 13 May 2022 21:35:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 285DF194975B;
	Fri, 13 May 2022 21:35:34 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 43388194975B for <cluster-devel@listman.corp.redhat.com>;
 Fri, 13 May 2022 21:35:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2C91D7C2F; Fri, 13 May 2022 21:35:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 282057C2B
 for <cluster-devel@redhat.com>; Fri, 13 May 2022 21:35:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 374DA29AA381
 for <cluster-devel@redhat.com>; Fri, 13 May 2022 21:35:27 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-D6D4NWHaNMCsKqaDf_xWpg-1; Fri, 13 May 2022 17:35:25 -0400
X-MC-Unique: D6D4NWHaNMCsKqaDf_xWpg-1
Received: by mail-ej1-f52.google.com with SMTP id z2so18573629ejj.3
 for <cluster-devel@redhat.com>; Fri, 13 May 2022 14:35:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hiVPxXcKKvs645f67vw4fyY/1EsP6WHDPNLF6XpOy5w=;
 b=PdGSyrWVcFpOuXvMHmy7qNr5C0XL2anoAcZ34CwPseBd/0SKvWYZtDdSWExCUe3QpM
 N43bnRcuPqJ/uXIihrcpJTUyodJjvpKRAfbQmubA8xkViKuM2nsHJAlGNnJJqzhoYQea
 gH6dNINwPkM67SnDNcTS3Pat4AyKS3iPm5w3UIa3aymtcWbURhIICGSXRoUbSmnZbGhJ
 pLYUQ0+sbcv6+iewXt94goX/xf1/EpCxcJqTsBqBJiYYUic/FlbymbRjv3QotNDieMHO
 qXilJ0TjQWvsW0X5DR5qmxFMV5DBHJRNLblL9lbnEGdlVjNm75MONl9abHOIDSCndn1n
 jlCg==
X-Gm-Message-State: AOAM533ty/C/Ue7yHYcKCBo90prkJa4rxZpu2ZIFDuwiXDiPSC3diqe3
 exwtjJgYuEbryMqbFraOKIUKrAJbrf7yvRdB
X-Google-Smtp-Source: ABdhPJw/7MlnCsoVRDRPyJ+Ue9kh9xmCnR/yarwNWZD5Sg9Mzj8n4RQJaQDhX7rVCVC68HxdIcH53w==
X-Received: by 2002:a17:906:a188:b0:6f4:f5cd:27bd with SMTP id
 s8-20020a170906a18800b006f4f5cd27bdmr6119730ejy.406.1652477724049; 
 Fri, 13 May 2022 14:35:24 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50]) by smtp.gmail.com with ESMTPSA id
 el22-20020a170907285600b006f3ef214e23sm1137126ejc.137.2022.05.13.14.35.23
 for <cluster-devel@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 14:35:23 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id
 o12-20020a1c4d0c000000b00393fbe2973dso7593108wmh.2
 for <cluster-devel@redhat.com>; Fri, 13 May 2022 14:35:23 -0700 (PDT)
X-Received: by 2002:a7b:c106:0:b0:394:19aa:4f91 with SMTP id
 w6-20020a7bc106000000b0039419aa4f91mr16898739wmi.68.1652477722759; Fri, 13
 May 2022 14:35:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220513210710.4124506-1-agruenba@redhat.com>
In-Reply-To: <20220513210710.4124506-1-agruenba@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 13 May 2022 14:35:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjjnfgmUuYBrXSjXD167w+87EZyMT79h_iTH84+__wtbw@mail.gmail.com>
Message-ID: <CAHk-=wjjnfgmUuYBrXSjXD167w+87EZyMT79h_iTH84+__wtbw@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: Re: [Cluster-devel] [GIT PULL] gfs2 fixes
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
Cc: cluster-devel <cluster-devel@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, May 13, 2022 at 2:07 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> Would you like to still pull these fixes for v5.18, or should we send them in
> the next merge window?

I've pulled them. Any filesystem corruption issue sounds scary enough
that it doesn't sound very sane to delay fixes.

            Linus

