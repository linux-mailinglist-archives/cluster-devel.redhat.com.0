Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 168F5727FF5
	for <lists+cluster-devel@lfdr.de>; Thu,  8 Jun 2023 14:27:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686227234;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=99DxBnaZUEbAqMp4zX7cQ0uWWclnnpqDzA9UnIQbL20=;
	b=iVMgSlGON77KWA722JwUsaP46btT8dcMpgcdRkmu0FKq1rju7aTqLZ2oiAB/yX/GBOf+Po
	QPFsICPem5C88XCMgAMxbWAQKJPfWaDeSWmnTdVZnytSOmJp/W3AYYtM5MjZOf/Qcd0RRb
	LGhnMOqdq4bNNCR0gmsHy4E6O7nJJ/Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-yXajvgl6NVGHLcVuvlCi_Q-1; Thu, 08 Jun 2023 08:27:10 -0400
X-MC-Unique: yXajvgl6NVGHLcVuvlCi_Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F091811E8E;
	Thu,  8 Jun 2023 12:27:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 23F231121314;
	Thu,  8 Jun 2023 12:27:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A766C19451C1;
	Thu,  8 Jun 2023 12:27:07 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BB2D8194658C for <cluster-devel@listman.corp.redhat.com>;
 Thu,  8 Jun 2023 12:26:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A511A2166B26; Thu,  8 Jun 2023 12:26:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D3852166B25
 for <cluster-devel@redhat.com>; Thu,  8 Jun 2023 12:26:59 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 810A1101A58B
 for <cluster-devel@redhat.com>; Thu,  8 Jun 2023 12:26:59 +0000 (UTC)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-17r4H5GyMfaisnBK0-KJpw-1; Thu, 08 Jun 2023 08:26:50 -0400
X-MC-Unique: 17r4H5GyMfaisnBK0-KJpw-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-5142da822cbso610116a12.2
 for <cluster-devel@redhat.com>; Thu, 08 Jun 2023 05:26:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686227209; x=1688819209;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=99DxBnaZUEbAqMp4zX7cQ0uWWclnnpqDzA9UnIQbL20=;
 b=UYcX+noEfjV3PfL5C3WyQ5mesAoU5QctvV6R6qN+gJ9Huq3EWJtxS5+OQpzlOUP3ex
 rjuK2Kb63b6FbI2l/JV68jHswy8CQ6N2ZNnokUTOfS5Z86789A7k1ztMtdyHlV3ESlXW
 D+91YVBMxuGX1tm3JRTXKSv7rCnhOyaUegB7dJfiBKldcuq8A0S2xPzzbg77kjNrVKVY
 f2/DO+pNFp24U/YOsUmJa+NOCnEGRTzknWrvyUX14vGHHLzZz+86c1RtUKgRukbgLV7z
 kRl4FkGEzDkIxnUVjLl+ce3ajB0+xciKpGISLKmqHQ47EMZk5YXshOvdAle565GmbQRQ
 jI8A==
X-Gm-Message-State: AC+VfDytXw5/lTzJ0GuGv8yaN1OKFrR5Vk8EIonKhmLytVbUcChg9eAV
 rZnKUJmChT4vSZebCtvBhfaeAXMu6J0RAsi01ateDFzfgygDDcjbd89Z2ThSYsLlVL6+Am4daBb
 tN8Y3j1sk6Xx7Gqh1XSiu8f2EXYlah+3/EUb6qw==
X-Received: by 2002:a17:907:7d8c:b0:961:b0:3dfd with SMTP id
 oz12-20020a1709077d8c00b0096100b03dfdmr8924897ejc.7.1686227209609; 
 Thu, 08 Jun 2023 05:26:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6rIJnxOZ/k6AILEkTqFs3rcnLiGPhtn521OxmI8TJH1Xhui8U5Qn7FhKUXevEAS25sXJIOmzsoLC0PnSe3NTE=
X-Received: by 2002:a17:907:7d8c:b0:961:b0:3dfd with SMTP id
 oz12-20020a1709077d8c00b0096100b03dfdmr8924884ejc.7.1686227209377; Thu, 08
 Jun 2023 05:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230608105821.354272-1-aahringo@redhat.com>
In-Reply-To: <20230608105821.354272-1-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Thu, 8 Jun 2023 08:26:38 -0400
Message-ID: <CAK-6q+i1G2r7p2UqFGEMjMwVuJ54=5ukubbyiAxSYEt7gkBzXA@mail.gmail.com>
To: teigland@redhat.com
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCHv2 dlm/next] fs: dlm: fix nfs async lock
 callback handling
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 8, 2023 at 6:58=E2=80=AFAM Alexander Aring <aahringo@redhat.com=
> wrote:
>
> This patch is fixing the current the callback handling if a nfs async
> lock request signaled if fl_lmops is set.
>
> When using `stress-ng --fcntl 32` on the kernel log there are several
> messages like:
>
> [11185.123533] dlm: dlm_plock_callback: vfs lock error 5d5127 file 000000=
002dd10f4d fl 000000007d13afae
> [11185.127135] dlm: dlm_plock_callback: vfs lock error 5d5127 file 000000=
002dd10f4d fl 00000000a6046fa0
> [11185.142668] dlm: dlm_plock_callback: vfs lock error 5d5127 file 000000=
002dd10f4d fl 000000001d13dfa5
>
> The commit 40595cdc93ed ("nfs: block notification on fs with its
> own ->lock") removed the FL_SLEEP handling if the filesystem implements
> its own ->lock. The strategy is now that the most clients polling
> blocked requests by using trylock functionality.
>
> Before commit 40595cdc93ed ("nfs: block notification on fs with its own
> ->lock") FL_SLEEP was used even with an own ->lock() callback. The fs
> implementation needed to handle it to make a difference between a
> blocking and non-blocking lock request. This was never being implemented
> in such way in DLM plock handling. Every lock request doesn't matter if
> it was a blocking request or not was handled as a non-blocking lock
> request.
>
> This patch fixes the behaviour until commit 40595cdc93ed ("nfs: block
> notification on fs with its own ->lock"), but it was probably broken
> long time before.
>

mhhh, this patch only removes the book keeping of "cat /proc/locks"
and when I am observing it I don't see fcntl() locks when using nfs
with gfs2 under locks there and this is the issue here.

I need to investigate more into this.

- Alex

