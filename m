Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B146C7298
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Mar 2023 22:51:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679608305;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=m9tjYpRfGyQ0DWCdxSWns8C9usJ6/6Y+ugnz5Vzrwjo=;
	b=he6Q2YEZT2Pjk7yMflB+G/rJBeiPG41YQnDWYwUaSDmcEwt4AxFOllMI/vRwjGq3CAMTu2
	JC2K1oD6R9KNjY4oad+Bxi0F1gXYwCDWvqknTkK8Ap07wQ/FdkyO/znKYvhmW2E1NJR+5/
	b2aj45+s1yjhNIqm/I5NoVltU9jLwzE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-cXT2pPWkM7Kt1HK_S_L2yQ-1; Thu, 23 Mar 2023 17:51:42 -0400
X-MC-Unique: cXT2pPWkM7Kt1HK_S_L2yQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AEAE1C0419E;
	Thu, 23 Mar 2023 21:51:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9E4A6C15BA0;
	Thu, 23 Mar 2023 21:51:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 557DD19465BB;
	Thu, 23 Mar 2023 21:51:40 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 802571946587 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 23 Mar 2023 21:51:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 62FD31121315; Thu, 23 Mar 2023 21:51:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BAB51121314
 for <cluster-devel@redhat.com>; Thu, 23 Mar 2023 21:51:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B49F85A5B1
 for <cluster-devel@redhat.com>; Thu, 23 Mar 2023 21:51:38 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-Au0kSR7ZN7e3zRHVuUPi3Q-1; Thu, 23 Mar 2023 17:51:36 -0400
X-MC-Unique: Au0kSR7ZN7e3zRHVuUPi3Q-1
Received: by mail-ed1-f51.google.com with SMTP id x3so646803edb.10
 for <cluster-devel@redhat.com>; Thu, 23 Mar 2023 14:51:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679608295;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m9tjYpRfGyQ0DWCdxSWns8C9usJ6/6Y+ugnz5Vzrwjo=;
 b=KCLwzOW03SDh/WdPhrtLkhlUMwHug2bXZVUeRGMl4CIoYedw3tyPOxr9wcimXwGIB5
 SuMdZE6E/su3jG2Qr7q4Jk1024BSbe20F+1g9U1HMlmXZImpg+LvVq0/KJsCQl6YXJLc
 X94VAL+HH8GjuNKGt7db0hrrHFCttlAWkNVLYFS+9+JpIoDbpH+Ky9JuIN4U/ptXJpI6
 hAox99vEsqrjI+b6cIqTzZtDepiAIDAWqmIwBead1QaTeDk+5dUxcM2M5zeT0Ma13mgt
 IElsAuqXuclN94LvSVvY7WVnDBBv8VWck4TigPTuNVj5HUb5Vg0kSCp48n+3nSuRMEZ3
 T9PA==
X-Gm-Message-State: AAQBX9dZRO6tObH+5VMVx5uXs1bLd71PgnNpn7NTu4Eacz9sa6ZSNQBS
 Nsc20GnlyIT85yd9UlJ13XnrqtwAL9cqZzFSIIYxYA==
X-Google-Smtp-Source: AKy350b/nudTFRul/vD3Bgz2ZFzmWDEwByTath6SnNj/nqPg0NzswJYeoQvSkjBKcC0UBvmswlIucw==
X-Received: by 2002:a17:906:8519:b0:923:1714:b3d0 with SMTP id
 i25-20020a170906851900b009231714b3d0mr515133ejx.19.1679608294917; 
 Thu, 23 Mar 2023 14:51:34 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com.
 [209.85.208.43]) by smtp.gmail.com with ESMTPSA id
 hy22-20020a1709068a7600b008e53874f8d8sm9117653ejc.180.2023.03.23.14.51.34
 for <cluster-devel@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 14:51:34 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id cn12so755978edb.4
 for <cluster-devel@redhat.com>; Thu, 23 Mar 2023 14:51:34 -0700 (PDT)
X-Received: by 2002:a17:907:2c66:b0:931:faf0:3db1 with SMTP id
 ib6-20020a1709072c6600b00931faf03db1mr4152130ejc.4.1679608293841; Thu, 23 Mar
 2023 14:51:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230323184537.749868-1-agruenba@redhat.com>
In-Reply-To: <20230323184537.749868-1-agruenba@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 23 Mar 2023 14:51:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=whms=0Cvmk946a0Pebv1YLWiuYCjyVy6yNeBp55+R8sMw@mail.gmail.com>
Message-ID: <CAHk-=whms=0Cvmk946a0Pebv1YLWiuYCjyVy6yNeBp55+R8sMw@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [GIT PULL] gfs2 fix for v6.3-rc4
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 23, 2023 at 11:45=E2=80=AFAM Andreas Gruenbacher
<agruenba@redhat.com> wrote:
>
> From: Linus Torvalds <torvalds@linux-foundation.org>

Wat?

>   git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git gfs2-=
v6.3-rc3-fix

-ENOSUCHTAG

> for you to fetch changes up to 260595b439776c473cc248f0de63fe78d964d849:

.. and no such commit available in any other tag or branch either.

Did you forget to push out?

                    Linus

