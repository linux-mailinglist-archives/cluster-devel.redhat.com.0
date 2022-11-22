Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 10750633A51
	for <lists+cluster-devel@lfdr.de>; Tue, 22 Nov 2022 11:42:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669113725;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=d4bBwFpw/JtzmjBWlLagA7Fmkmm3Jz+aY8iRdpUiYzs=;
	b=FtfBun0I7m9/81zW9Oft9T1DU7A2fyXu/0MBNmdl0PfuTI0dEpdE+JdGeqLqm4LuEGcrUx
	e5QDCJnPObNptPNxeob7IpvalqEovunsZXTH3r1Gf1Q6dliog1DSt/itSsiRsy8UDYdkuA
	Fp1uJalSlYbIv1nEmAtFhUjgn4hC/KU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-u7IrsReSNziwn5RYVDP6Fg-1; Tue, 22 Nov 2022 05:42:02 -0500
X-MC-Unique: u7IrsReSNziwn5RYVDP6Fg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6EA0438149A7;
	Tue, 22 Nov 2022 10:42:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2AA2F492B17;
	Tue, 22 Nov 2022 10:41:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5CA8B194658D;
	Tue, 22 Nov 2022 10:41:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 73EAC1946587 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 22 Nov 2022 10:41:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3E19B1731B; Tue, 22 Nov 2022 10:41:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 36B0417582
 for <cluster-devel@redhat.com>; Tue, 22 Nov 2022 10:41:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17B01882822
 for <cluster-devel@redhat.com>; Tue, 22 Nov 2022 10:41:54 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-232-333GAWRiOZizprEqFn-NIg-1; Tue, 22 Nov 2022 05:41:51 -0500
X-MC-Unique: 333GAWRiOZizprEqFn-NIg-1
Received: by mail-qt1-f176.google.com with SMTP id s4so8980696qtx.6;
 Tue, 22 Nov 2022 02:41:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d4bBwFpw/JtzmjBWlLagA7Fmkmm3Jz+aY8iRdpUiYzs=;
 b=XN7kED44rUtc21x2QtV1pu7C9+D8VIVbQOh9m1KQwoLQ6fr2LPpKURFg74HzsCVfn2
 SgHJTT19/oAKVFM3Fz+Huir5UMP74+/l4FxORT+GaQhfpI6S6DwbLz5On0mTs4kpJPTk
 sAAa3VvUZTvVcxF2s9c4Iqxe9KNiB4HQesjmy5tQreF8UcdYVIw82DF5AUAZh2eOW1hK
 hQQNtyaWRCpZ/8MjE/4SNtWukwGjdJvKJgT7y6MrwAbN+GUcviGKmEgJM8kKaHv/nu31
 CGEOXWQhdRWpd2ORdFdw0tYLJUrFfcVJh75wmy881qg/wU5zhlaF5TLI6nQclayrIsQG
 S99w==
X-Gm-Message-State: ANoB5pkeAnM9M4J1EmGG7dgyIH4/ANmI7TdUFXbYfpSqsUFHXTkF1+Mv
 ufQwueWIkGuwqS+mVKZdO2QxdkeZKqIe5A==
X-Google-Smtp-Source: AA0mqf4LVEZy0P+ZZ5I4dTDOlu+JKnQtPp7xFf+f4DGEopWVvd2MoP0yKvGMxrX+2bFbrJGoBvdL5g==
X-Received: by 2002:a05:622a:17ca:b0:39c:d841:9b6f with SMTP id
 u10-20020a05622a17ca00b0039cd8419b6fmr20974864qtk.640.1669113710161; 
 Tue, 22 Nov 2022 02:41:50 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172]) by smtp.gmail.com with ESMTPSA id
 br35-20020a05620a462300b006cfc01b4461sm9973019qkb.118.2022.11.22.02.41.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 02:41:50 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id 7so16810783ybp.13;
 Tue, 22 Nov 2022 02:41:49 -0800 (PST)
X-Received: by 2002:a25:8249:0:b0:6dd:b521:a8f2 with SMTP id
 d9-20020a258249000000b006ddb521a8f2mr2650165ybn.380.1669113709053; Tue, 22
 Nov 2022 02:41:49 -0800 (PST)
MIME-Version: 1.0
References: <20221122183833.6509537e@canb.auug.org.au>
In-Reply-To: <20221122183833.6509537e@canb.auug.org.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Nov 2022 11:41:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX-vHH5b_Qg6-CyB4kRhHaHN=HW=FeRkJ85EM7jL41Egw@mail.gmail.com>
Message-ID: <CAMuHMdX-vHH5b_Qg6-CyB4kRhHaHN=HW=FeRkJ85EM7jL41Egw@mail.gmail.com>
To: Alexander Aring <aahringo@redhat.com>, David Teigland <teigland@redhat.com>,
 Christine Caulfield <ccaulfie@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] dlm build failure (was: Re: linux-next: Tree for
 Nov 22)
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
Cc: cluster-devel@redhat.com, Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 22, 2022 at 8:40 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Merging dlm/next (dbb751ffab0b fs: dlm: parallelize lowcomms socket handling)

noreply@ellerman.id.au reported a build failure for e.g. m68k/defconfig[1]:

    ERROR: modpost: "lockdep_is_held" [fs/dlm/dlm.ko] undefined!

which I have bisected to this commit.  The corresponding patch does not seem
to have been posted for public review to any mailing list archived by lore.

[1] http://kisskb.ellerman.id.au/kisskb/buildresult/14835766/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

