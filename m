Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CFD6652F6
	for <lists+cluster-devel@lfdr.de>; Wed, 11 Jan 2023 05:54:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673412867;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AwDGIIG2kEW7th9yR8DoIeZiikP/oVS4/IYm7KTM+N0=;
	b=GiFNasKbq56PCpnnziXPuGEZ+mn9s5+W/fK8/sqlweP/z7Vg9vbWklmmyff4GBxufLnpmf
	vm1r5FRY/UIHkdIEBY02sARE3O8+r1jrdApC8rGs9JUnJw66ppMivnpre0u/vpScCqU97w
	McpMpjzvyTbl+aKmu12hgL3dIsCwi+0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510--boxzC6CPdGy41tUeRzGBw-1; Tue, 10 Jan 2023 23:54:22 -0500
X-MC-Unique: -boxzC6CPdGy41tUeRzGBw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6042985C6E2;
	Wed, 11 Jan 2023 04:54:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9C0B140C1141;
	Wed, 11 Jan 2023 04:54:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5E870194E11C;
	Wed, 11 Jan 2023 04:54:19 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 29C7A19465A0 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 11 Jan 2023 04:54:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5BBEA492B01; Wed, 11 Jan 2023 04:54:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 547F0492B00
 for <cluster-devel@redhat.com>; Wed, 11 Jan 2023 04:54:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3571C3806720
 for <cluster-devel@redhat.com>; Wed, 11 Jan 2023 04:54:09 +0000 (UTC)
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-397-fmtaZvt9O8CjRtMxnz4TTA-1; Tue, 10 Jan 2023 23:54:08 -0500
X-MC-Unique: fmtaZvt9O8CjRtMxnz4TTA-1
Received: by mail-pf1-f199.google.com with SMTP id
 k9-20020aa79989000000b00586c3ab4ce6so4602647pfh.5
 for <cluster-devel@redhat.com>; Tue, 10 Jan 2023 20:54:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AwDGIIG2kEW7th9yR8DoIeZiikP/oVS4/IYm7KTM+N0=;
 b=p+9smdQucVI6qwElVECK6qiumZF68KGQSgesvjbplznGkST/lcUOG/syiQQzqlYKlk
 uES3mIV/nVc1Y9lcGvoIwKf288cyZ4aEv9cSdxrJPYwGMqnnzW1W85UuakpxRLMOwZGX
 A4v9imtPRBrpiGuDO/HKBcv1JC93Yo/uqkejsHdjAILoh+RYmrrGMNZPYJz5tXOG8xdN
 HHt9ZhSIN840pYVnjUMYCyauXJWTLLaRxaNQZwkjYe3CvJvyL7AV7SrHy0DQDvVNA9M1
 zVZPakr4eHEJsS4IrZrwn7DBoNZmNmFB9Ouk/zrqVAvxV0C41Yh1NJKSCDTaG3QlyMbi
 /AZA==
X-Gm-Message-State: AFqh2kpK6GoqHooDZlqduIrIJ/8EauWADrtZz191Twa0LxJgKgGhF+DR
 gJZ7XzrAhFq64xbPUncsm2Z1iyLxsn5mHrI5TmHLICKU+TbLVG+p8PihIGaC44TnfjMYmeR6NUq
 oa9DOuQzQ94jSM0HHi+333Q==
X-Received: by 2002:a17:903:50e:b0:189:bda4:4a39 with SMTP id
 jn14-20020a170903050e00b00189bda44a39mr68317508plb.49.1673412846855; 
 Tue, 10 Jan 2023 20:54:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs+9rrIRD+6pRvHkwnX14gh2BCpLNg+4mxFg/ySKLAFpFMrHGq/R+Lf/NnqdSw7vAx/2ZYhMg==
X-Received: by 2002:a17:903:50e:b0:189:bda4:4a39 with SMTP id
 jn14-20020a170903050e00b00189bda44a39mr68317481plb.49.1673412846568; 
 Tue, 10 Jan 2023 20:54:06 -0800 (PST)
Received: from [10.72.14.8] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a170902654b00b001895d87225csm8944870pln.182.2023.01.10.20.53.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 20:54:05 -0800 (PST)
Message-ID: <330d1f1b-02b2-ceb1-5df5-ef6ce0061eb2@redhat.com>
Date: Wed, 11 Jan 2023 12:53:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: Jeff Layton <jlayton@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Eric Van Hensbergen <ericvh@gmail.com>, Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Ilya Dryomov <idryomov@gmail.com>,
 Steve French <sfrench@samba.org>, Paulo Alcantara <pc@cjr.nz>,
 Ronnie Sahlberg <lsahlber@redhat.com>, Shyam Prasad N
 <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
 Christine Caulfield <ccaulfie@redhat.com>,
 David Teigland <teigland@redhat.com>, Chuck Lever <chuck.lever@oracle.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>,
 Namjae Jeon <linkinjeon@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anna Schumaker <anna@kernel.org>, Mark Fasheh <mark@fasheh.com>,
 Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg
 <martin@omnibond.com>, "Darrick J. Wong" <djwong@kernel.org>
References: <20230105211937.1572384-1-jlayton@kernel.org>
From: Xiubo Li <xiubli@redhat.com>
In-Reply-To: <20230105211937.1572384-1-jlayton@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH v2] filelock: move file locking
 definitions to separate header file
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
Cc: linux-cifs@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 linux-xfs@vger.kernel.org, devel@lists.orangefs.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-afs@lists.infradead.org, cluster-devel@redhat.com,
 ocfs2-devel@oss.oracle.com, Steve French <stfrench@microsoft.com>,
 linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 06/01/2023 05:19, Jeff Layton wrote:
> The file locking definitions have lived in fs.h since the dawn of time,
> but they are only used by a small subset of the source files that
> include it.
>
> Move the file locking definitions to a new header file, and add the
> appropriate #include directives to the source files that need them. By
> doing this we trim down fs.h a bit and limit the amount of rebuilding
> that has to be done when we make changes to the file locking APIs.
>
> Reviewed-by: Xiubo Li <xiubli@redhat.com>
> Reviewed-by: Christian Brauner (Microsoft) <brauner@kernel.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: David Howells <dhowells@redhat.com>
> Acked-by: Chuck Lever <chuck.lever@oracle.com>
> Acked-by: Joseph Qi <joseph.qi@linux.alibaba.com>
> Acked-by: Steve French <stfrench@microsoft.com>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>   arch/arm/kernel/sys_oabi-compat.c |   1 +
>   fs/9p/vfs_file.c                  |   1 +
>   fs/afs/internal.h                 |   1 +
>   fs/attr.c                         |   1 +
>   fs/ceph/locks.c                   |   1 +

ceph part looks good to me.

Thanks

- Xiubo


