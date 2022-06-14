Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2997D54B3F6
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Jun 2022 16:55:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655218514;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Ig/HLRzJX8qYO+zc3NhDEihKULCt3zi53o/yrlFVOUw=;
	b=FOPvGKkSlniuR7dMFGX1B0OskXidZJsS+DE+mvjWCoV7YjE3f6HO+KbcX+quIPKd4M/QfR
	nE1EQYY8jABHaYQeoyDcdsDdmAx2mRHHSu+QmHm5dsaBZcKyF1iPnv3pjLMcnL8Z1N6T73
	TEOj4P0HwwBOmjIGonkQCSsFkBQnH+A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-uWrKOYxIOb-UhYTItilf3A-1; Tue, 14 Jun 2022 10:55:10 -0400
X-MC-Unique: uWrKOYxIOb-UhYTItilf3A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4F5F299E758;
	Tue, 14 Jun 2022 14:55:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 05D48492CA6;
	Tue, 14 Jun 2022 14:55:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 416951947076;
	Tue, 14 Jun 2022 14:55:07 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A683F1947067 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 14 Jun 2022 14:55:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 71CDD2026D07; Tue, 14 Jun 2022 14:55:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E0DD2026D64
 for <cluster-devel@redhat.com>; Tue, 14 Jun 2022 14:55:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52BBF8027EE
 for <cluster-devel@redhat.com>; Tue, 14 Jun 2022 14:55:05 +0000 (UTC)
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-DlH-ViCxORaqC2ZO9GNW5g-1; Tue, 14 Jun 2022 10:55:04 -0400
X-MC-Unique: DlH-ViCxORaqC2ZO9GNW5g-1
Received: by mail-qv1-f71.google.com with SMTP id
 ke5-20020a056214300500b00461fc78b983so6057913qvb.17
 for <cluster-devel@redhat.com>; Tue, 14 Jun 2022 07:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ig/HLRzJX8qYO+zc3NhDEihKULCt3zi53o/yrlFVOUw=;
 b=dFcwcYT6KbA39XFaz9Me8mCguSImn1Rzd0HfUCyNId/YNzjvL1j2WdNOmVa40uiGzE
 uyb8mgF2EDU96Thb5mNFJwVRQenqR5GzDZa3iJPrNLj6nC5SR41ngjgEbb/c6ocNa8hI
 2WKMHYfa91T9sOXwc0dLxa5jwnvQP4GmZdi8O2nez14/hG2gDp64zb+DIW1CCK9xTWev
 WOts2xA9giiWdMfvE6EGjMl/vzRouxixzSAZo0JtCgGq6jX5v9tP48CgMUAZIYZDerQk
 IupECTIHos8Smq8/ndhdjaPeleheJNGD2Bx6TbkwTqQ5Kc5SXSOCMZF/5+6oz+867SHu
 sOHw==
X-Gm-Message-State: AOAM5306u6rwtDHQd/4eSytf3qUhYp2+3Uqy18xZcLWKmMC+ge9IX725
 Dv6HjiV90kLLXzmOzmTAUfafJ7XixqQa0H8fBFojW68MDYjxqgluQum2oJ1CsvTksRSt96dV+h3
 WMEcHQ93H2H/ilfI6XgsyNa7kVZ/H6GCJwYnmsQ==
X-Received: by 2002:a37:510:0:b0:6a6:ab9e:1b80 with SMTP id
 16-20020a370510000000b006a6ab9e1b80mr4192823qkf.770.1655218503539; 
 Tue, 14 Jun 2022 07:55:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjpiU1g1MGXjmCk1iLiI+SOMpiuEwW4+mTM4vzt5Enq/HnC7CMuEuSY8W8WbfeXPCwyZgqO7rz8QK/sMEEYA0=
X-Received: by 2002:a37:510:0:b0:6a6:ab9e:1b80 with SMTP id
 16-20020a370510000000b006a6ab9e1b80mr4192799qkf.770.1655218502968; Tue, 14
 Jun 2022 07:55:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220610170616.3480642-1-aahringo@redhat.com>
 <20220610170616.3480642-7-aahringo@redhat.com>
In-Reply-To: <20220610170616.3480642-7-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Tue, 14 Jun 2022 10:54:52 -0400
Message-ID: <CAK-6q+jaPxjZyJ7XEKLgcborCyGccK3xkWYVXaKa5OW64hviqg@mail.gmail.com>
To: David Teigland <teigland@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH v5.19-rc1 6/7] fs: dlm: change -EINVAL
 recovery error to -EAGAIN
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
Cc: cluster-devel <cluster-devel@redhat.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, Jun 10, 2022 at 1:06 PM Alexander Aring <aahringo@redhat.com> wrote:
>
> This patch changes a -EINVAL error for dlm_master_lookup() to -EAGAIN.
> It is a critical error which should not happened, if it happens there
> exists an issue. However we still track those issues inside the lock but
> if they happen we try to run recovery again if those issues will get
> resolved. If not recovery has a logic to fail this node after several
> retries.
>
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/dlm/lock.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
> index 226822f49d30..ad32a883c1fd 100644
> --- a/fs/dlm/lock.c
> +++ b/fs/dlm/lock.c
> @@ -1018,7 +1018,10 @@ int dlm_master_lookup(struct dlm_ls *ls, int from_nodeid, char *name, int len,
>                           from_nodeid, dir_nodeid, our_nodeid, hash,
>                           ls->ls_num_nodes);
>                 *r_nodeid = -1;
> -               return -EINVAL;
> +               /* this case should never occur, we try again
> +                * to hope it got resolved
> +                */
> +               return -EAGAIN;

I moved this -EAGAIN return if  dlm_master_lookup() in
dlm_recover_directory() returns -EINVAL as this function is also used
in non-recovery handling whereas dlm_recover_directory() is used in
recovery handling only. There was once an issue that
dlm_recover_directory() returned -EINVAL in recovery handling and this
patch should somehow try to resolve the issue by assuming it is a
temporal issue when exchanging messages or scheduling some other
tasks... unfortunately there was no more information how this issue
was triggered.

- Alex

