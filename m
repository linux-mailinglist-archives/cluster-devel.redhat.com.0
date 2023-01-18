Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DB38D671D89
	for <lists+cluster-devel@lfdr.de>; Wed, 18 Jan 2023 14:20:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674048032;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Xhhtq1O/3nhYZ/YKMOOCemA0c1SW8oSQ7QA8AzdOczY=;
	b=S/E9bd/m8KFG07ZwLw3nq5Hm40kC+ZaaQBhPGrT6TAnCsFfn4W2pJvkPdsaIYTxM1mGQYa
	ZhnKtEEj9VoqGHJkjLmhHt4HHn+OpN+9r6mLLNi8bA45Io5t0xXNGM6DZCGygdGPf/8ZC0
	sMXkjADkCfnTBgJvAxqR8cV9p2kzi5g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292-VrqQxw5uPgqEAQvsJbDW8A-1; Wed, 18 Jan 2023 08:20:30 -0500
X-MC-Unique: VrqQxw5uPgqEAQvsJbDW8A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D9201C29D44;
	Wed, 18 Jan 2023 13:20:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B76042166B26;
	Wed, 18 Jan 2023 13:20:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 85DDF1946A6D;
	Wed, 18 Jan 2023 13:20:28 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4AFAD19465B7 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 18 Jan 2023 13:10:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 25F501121318; Wed, 18 Jan 2023 13:10:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E0A61121315
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 13:10:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F386C3815F64
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 13:10:01 +0000 (UTC)
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-O1sKpvSbP5-EVxxGVByKRQ-1; Wed, 18 Jan 2023 08:09:55 -0500
X-MC-Unique: O1sKpvSbP5-EVxxGVByKRQ-1
Received: from fsav117.sakura.ne.jp (fsav117.sakura.ne.jp [27.133.134.244])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 30ID9p3k072870;
 Wed, 18 Jan 2023 22:09:51 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav117.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav117.sakura.ne.jp);
 Wed, 18 Jan 2023 22:09:51 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav117.sakura.ne.jp)
Received: from [192.168.1.20] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 30ID9pN7072866
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 18 Jan 2023 22:09:51 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <ecfea97d-7e0a-c7c7-bbd5-fb33eef574b1@I-love.SAKURA.ne.jp>
Date: Wed, 18 Jan 2023 22:09:51 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: agruenba@redhat.com, rpeterso@redhat.com
References: <000000000000c921b105ef617f05@google.com>
 <75f056d3-fa52-e399-29cc-4388cae069ff@I-love.SAKURA.ne.jp>
In-Reply-To: <75f056d3-fa52-e399-29cc-4388cae069ff@I-love.SAKURA.ne.jp>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [syzbot] INFO: task hung in freeze_super (3)
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Ping?

On 2023/01/04 22:47, Tetsuo Handa wrote:
> I suspect that cleanup is not done appropriately when gfs2_find_jhead() failed.
> Looking into gfs2_make_fs_rw(), I see there are two worrisome things.
> 
> One is that gfs2_make_fs_rw() returns an error without calling gfs2_consist(sdp) when
> gfs2_find_jhead() returned an error whereas gfs2_make_fs_rw() returns -EIO after calling
> gfs2_consist(sdp) when head.lh_flags does not contain GFS2_LOG_HEAD_UNMOUNT flag.
> 
> Since head.lh_flags is assigned by gfs2_find_jhead(), we might want to call gfs2_consist(sdp)
> when gfs2_find_jhead() returned an error. And actually
> 
> --- a/fs/gfs2/super.c
> +++ b/fs/gfs2/super.c
> @@ -138,7 +138,11 @@ int gfs2_make_fs_rw(struct gfs2_sbd *sdp)
>                 return -EIO;
> 
>         error = gfs2_find_jhead(sdp->sd_jdesc, &head, false);
> -       if (error || gfs2_withdrawn(sdp))
> +       if (error) {
> +               gfs2_consist(sdp);
> +               return error;
> +       }
> +       if (gfs2_withdrawn(sdp))
>                 return error;
> 
>         if (!(head.lh_flags & GFS2_LOG_HEAD_UNMOUNT)) {
> 
> avoids this deadlock. But I don't know when/how to use gfs2_withdraw().
> Please check if this change is appropriate.
> 
> The other worrisome thing is that gfs2_make_fs_rw() is returning 0 (and
> mount operation will continue) when gfs2_withdrawn() == true. Can the caller
> of gfs2_make_fs_rw() survive when callgfs2_make_fs_rw() returned 0 without
> processing
> 
>         /*  Initialize some head of the log stuff  */
>         sdp->sd_log_sequence = head.lh_sequence + 1;
>         gfs2_log_pointers_init(sdp, head.lh_blkno);
> 
> lines? Shouldn't the caller of gfs2_make_fs_rw() observe an error when
> gfs2_make_fs_rw() did not execute the
> 
> 	set_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
> 
> line due to gfs2_withdrawn() == true?
> 

